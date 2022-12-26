//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 19/12/2022.
//

import Foundation
public class ToShape {
    
    public static func from(cluster: ClusterModel, wordList: WordModelSOA, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        let gpuModel = executeGpu(cluster: cluster, wordList: wordList)
        let shapes = GpuShapeToShapeConverter.shapeCreation(gpuShape: gpuModel, wordList: wordList.Start)
        
        let filteredShapes = GpuShapeToShapeConverter.filter(shapes: shapes, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let sorted = filteredShapes.sorted { $0.score > $1.score}
        return sorted
    }
    
    
    public static func executeGpu(cluster: ClusterModel, wordList: WordModelSOA) -> GpuShapeModel {
        
        let (width, leadingWidth) = calculateWidth(cluster: cluster, wordLength: wordList.Len)
        let (height, leadingHeight) = calculateHeight(cluster: cluster, wordModel: wordList)
        let score = scoreShape(cluster: cluster, wordList: wordList.Start)
        let (startX,startY) = calculateXY(cluster:cluster, wordLength: wordList.Len, leadingWidthArray:leadingWidth, leadingHeightArray:leadingHeight)
        let isHorizontal = calculateIsHorizontal(cluster:cluster)
        
        let result = GpuShapeModel(stride: UInt8(cluster.stride), count: cluster.size, score: score, width: width, height: height, id: cluster.wordId, x:startX, y: startY, isHorizontal: isHorizontal)
        return result
    }
    
    public static func calculateIsHorizontal(cluster: ClusterModel) -> [Bool] {
        var isHorizontal: [Bool] = Array(repeating: true, count: cluster.size * cluster.stride)
        
        
        
        for i in stride(from:0, to: cluster.size * cluster.stride, by: cluster.stride) {
            for j in cluster.interlockHeight..<cluster.interlockHeight+cluster.interlockWidth {
                isHorizontal[i+j] = false
            }
        }
                        
        return isHorizontal
    }
    
    
    
    
    
    
    public static func calculateXY(cluster: ClusterModel, wordLength: [UInt8], leadingWidthArray:[UInt8], leadingHeightArray:[UInt8]) -> ([UInt8], [UInt8]) {
        
        
        let verticalWordCount = cluster.interlockWidth
        
        let horizontalWordCount = UInt8(cluster.interlockHeight)
        let horizontalWordCount_ = cluster.interlockHeight
        
        
        
        var startX: [UInt8] = Array(repeating: 0, count: cluster.wordArraySize())
        var startY: [UInt8] = Array(repeating: 0, count: cluster.wordArraySize())
        
        
        
        for shapeId in 0..<cluster.size {
            let leadingWidth = leadingWidthArray[shapeId]
            let leadingHeight = leadingHeightArray[shapeId]
            
            // First we do the vertical words
            for i in 0..<verticalWordCount {
                let wordPos = cluster.wordPosY(shapeId:shapeId, i:i)
                
                let wordId = Int(cluster.wordId[wordPos])
                
                //let word = wordList[wordId]
                let wordSize = wordLength[wordId]
                let pattern = cluster.patternVertical[i]
                
                // It is +1 so we can add the blocking character also
                let wordOverlap = wordSize - horizontalWordCount
                switch pattern {
                case .leading, .middle:
                    // Based on how much more there is an overlap compared to the normal overlap
                    startY[wordPos] = leadingHeight - wordOverlap
                case .trailing:
                    // We start when the leading width has finished
                    startY[wordPos] = leadingHeight
                case.outer:
                    let startPos = cluster.outerStart[wordPos]
                    
                    startY[wordPos] = leadingHeight - startPos
                }
                startX[wordPos] = leadingWidth + UInt8(i) + 1
            }
        
            for i in 0..<horizontalWordCount_ {
                
                let wordPos = cluster.wordPosX(shapeId:shapeId, i:i)
                
                let wordId = Int(cluster.wordId[wordPos])
                
                //let word = wordList[wordId]
                let wordSize = wordLength[wordId]
                let pattern = cluster.patternHorizontal[i]
                
                let overlap = wordSize - UInt8(verticalWordCount)
                switch pattern {
                case .leading, .middle:
                    startX[wordPos] = leadingWidth - overlap
                case .trailing:
                    startX[wordPos] = leadingWidth
                case.outer:
                    let startPos = cluster.outerStart[wordPos]
                    startX[wordPos] = UInt8(leadingWidth + UInt8(startPos) - overlap )
                }
                startY[wordPos] = leadingHeight + UInt8(i) + 1 // We need plus 1 to account for the blocking character .
            }
        }
        return (startX,startY)
    }
    
    public static func calculateHeight(cluster: ClusterModel, wordModel: WordModelSOA) -> ([UInt8],[UInt8]) {
        
        let verticalWordCount = cluster.interlockWidth
        
        let horizontalWordCount = UInt8(cluster.interlockHeight)
        
        
        var height: [UInt8] = Array(repeating: 0, count: cluster.size)
        // How many characters stick out to the top
        var leadingHeight: [UInt8] = Array(repeating: 0, count: cluster.size)
        for shapeId in 0..<cluster.size {
            var leadingSize: UInt8 = 0
            var trailingSize: UInt8 = 0
            
            // The interlockWidth is how many words are vertically placed
            for i in 0..<verticalWordCount {
                let pattern = cluster.patternVertical[i]
               
                let wordPos = cluster.wordPosY(shapeId: shapeId, i: i)
                let wordId = Int(cluster.wordId[wordPos])
                let wordSize = wordModel.Len[wordId]

                //let word = wordModel.Start[wordId]
                
                // We take out the number of horizontal words as they will all occupy the cluster block
                let wordSizeOverlap = wordSize - horizontalWordCount
                
                switch pattern {
                case .leading:
                    leadingSize = max(leadingSize, wordSizeOverlap)
                case .trailing:
                    trailingSize = max(trailingSize, wordSizeOverlap)
                case .outer:
                    let startPos = cluster.outerStart[wordPos]
                    leadingSize = max(leadingSize, startPos)
                    trailingSize = max(trailingSize, wordSizeOverlap - startPos)
                case .middle:
                    // None will poke out the front nor the back as it fits in the middle where the cluster is
                    break
                }
            }
            // We need to add the blocking character
            leadingHeight[shapeId] = UInt8(leadingSize)
            height[shapeId] = UInt8(leadingSize + horizontalWordCount + trailingSize + 2)
        }
        return (height, leadingHeight)
    }
    
    public static func calculateWidth(cluster: ClusterModel, wordLength: [UInt8]) -> ([UInt8],[UInt8]) {
        
        let verticalWordCount = UInt8(cluster.interlockWidth)
        
        let horizontalWordCount = cluster.interlockHeight
        
        // The width of the entire shape
        var width: [UInt8] = Array(repeating: 0, count: cluster.size)
        
        // How many characters stick out to the left
        var leadingWidth: [UInt8] = Array(repeating: 0, count: cluster.size)
        
        for shapeId in 0..<cluster.size {
            var leadingSize: UInt8 = 0
            var trailingSize: UInt8 = 0
            
            // Go through each and every horizontal word and see if it sticks out to the left or right
            for x in 0..<horizontalWordCount {
                
                let wordPos = cluster.wordPosX(shapeId: shapeId, i: x)
                // This is the actual word id that we want to find
                let wordId = cluster.wordId[wordPos]
                
                //let word = wordList[Int(wordId)]
                
                let wordSize = wordLength[Int(wordId)]
                let pattern = cluster.patternHorizontal[x]
                let wordSizeOverlap = wordSize - verticalWordCount
                switch pattern {
                case .leading:
                    // How many spaces would the word be poking out the front
                    leadingSize = max(leadingSize, wordSizeOverlap)
                case .trailing:
                    // how many spaces would the word be poking out the back
                    trailingSize = max(trailingSize, wordSizeOverlap)
                case .outer:
                    let startPos = cluster.outerStart[wordPos]
                    // Some will poke out the front
                    leadingSize = max(leadingSize, startPos)
                    // and some will poke out the back
                    trailingSize = max(trailingSize, wordSizeOverlap - startPos)
                case .middle:
                    // The word will not poke out the back or the front
                    break
                }
            }
            // We need to add the blocking character at the beginning of the word
            //leadingSize += 1
            //trailingSize += 1
            leadingWidth[shapeId] = leadingSize
            width[shapeId] = leadingSize + verticalWordCount + trailingSize + 2
        }
        return (width, leadingWidth)
    }
    
    
    
    
    /// Calculate a score for each and every item in the cluster by adding scores for each letter in the horizontal direction
    /// - Parameters:
    ///   - cluster: A cluster contains all words that follow the pattern
    ///   - wordList: A list of words
    /// - Returns: Score component of each and every shape, it is not limited to minimum score or anything like that, the filter happens afterwards.
    public static func scoreShape(cluster:ClusterModel, wordList: [String]) -> [UInt16] {
        
        var scores: [UInt16] = Array(repeating: 0, count: cluster.size)
        
        for shapeId in 0..<cluster.size {
            var score = 10 * cluster.stride

            // InterlockHeight is what tells us how many horizontal words there are as they are all stacked on top of each other
            for x in 0..<cluster.interlockHeight {
                
                let wordPos = cluster.wordPosX(shapeId: shapeId, i: x)
                
                let wordId = Int(cluster.wordId[wordPos])
                
                let word = wordList[wordId]
                let reverse = String(word.reversed())
                let pattern = cluster.patternHorizontal[x]

                switch pattern {
                case .leading, .middle:
                    for letterId in 0..<cluster.interlockWidth {
                        score += ScoreCalculator.score(forLetter: reverse[letterId])
                    }
                case .trailing:
                    for letterId in 0..<cluster.interlockWidth {
                        score += ScoreCalculator.score(forLetter: word[letterId])
                    }
                case .outer:
                    let startPos = cluster.outerStart[wordPos]
                    for letterId in 0..<cluster.interlockWidth {
                        score += ScoreCalculator.score(forLetter: word[letterId + Int(startPos)])
                    }
                }
            }
            scores[shapeId] = UInt16(score)
        }
        return scores
    }
}

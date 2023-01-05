//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 26/12/2022.
//

import Foundation
/// Converts a list of donuts to a list of shapes
public class DonutToShapeConverter {
    
    
    
    
    
    
    /// Convert the list of edges into the shape array
    /// - Parameters:
    ///   - edges: Edges are a valid set of shapes combined at one letter
    ///   - wordList: A set of words used when we calculated the edges
    /// - Returns: An array of ShapeModels which is a standard structure to represent any valid crozzle game or shape
    public static func toShape(fromDonut donuts: DonutModel, usingWords wordList: [String], scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel] {
        var result: [ShapeModel] = []
        result.reserveCapacity(donuts.shapeCount)
        
        var wordIndex = 0
        
        for _ in 0..<donuts.shapeCount {
            
            let topId = donuts.wordId[wordIndex]
            let bottomId = donuts.wordId[wordIndex + 1]
            let leftId = donuts.wordId[wordIndex + 2]
            let rightId = donuts.wordId[wordIndex + 3]
            
            let topWord = wordList[Int(topId)]
            let bottomWord = wordList[Int(bottomId)]
            let leftWord = wordList[Int(leftId)]
            let rightWord = wordList[Int(rightId)]
            
            let topPos = Int(donuts.startPos[wordIndex])
            let bottomPos = Int(donuts.startPos[wordIndex + 1])
            let leftPos = Int(donuts.startPos[wordIndex + 2])
            let rightPos = Int(donuts.startPos[wordIndex + 3])
            
            let pattern = String([topWord[topPos], rightWord[rightPos], bottomWord[bottomPos], rightWord[rightPos + Int(donuts.interlockHeight) - 1]])
            
            let score = ScoreCalculator.score(word: pattern) + 40
            
            
            if score >= scoreMin {
                
                let maxHorizontalPos = max(topPos, bottomPos)
                let maxVerticalPos = max(leftPos, rightPos)
                
                let topWordRemainingLength = topWord.count - topPos - 1
                let bottomWordRemainingLength = bottomWord.count - bottomPos - 1
                let remainingHorizontalLength = max(topWordRemainingLength, bottomWordRemainingLength)
                
                let width = maxHorizontalPos + remainingHorizontalLength + 2 + 1
                
                let leftWordRemainingLength = leftWord.count - leftPos
                let rightWordRemainingLength = rightWord.count - rightPos - 1
                let remainingVerticalLength = max(leftWordRemainingLength, rightWordRemainingLength)
                
                let height = maxVerticalPos + remainingVerticalLength + 2 + 1
                
                
                
                
                
                if ((width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax)) {
                    
                    let shape = ShapeModel(
                        s: UInt16(score),
                        w: UInt8(width),
                        h: UInt8(height),
                        p: [
                            PlacementModel(
                                id: topId,
                                x: UInt8(maxHorizontalPos - topPos),
                                y: UInt8(maxVerticalPos + 1),
                                isHorizontal: true),
                            PlacementModel(
                                id: bottomId,
                                x: UInt8(maxHorizontalPos - bottomPos),
                                y: UInt8(maxVerticalPos + donuts.interlockHeight), //5
                                isHorizontal: true),
                            PlacementModel(
                                id: leftId,
                                x: UInt8(maxHorizontalPos + 1),
                                y: UInt8(maxVerticalPos - leftPos),
                                isHorizontal: false),
                            PlacementModel(
                                id: rightId,
                                x: UInt8(maxHorizontalPos + donuts.interlockWidth),
                                y: UInt8(maxVerticalPos - rightPos),
                                isHorizontal: false)
                        ])
                    result.append(shape)
                }
                
            }
            
            wordIndex += 4
        }
        
        result.sort { $0.s > $1.s}
        
        return result
    }
    
    
}

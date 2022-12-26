//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 24/12/2022.
//

import Foundation
class ToSearchableShape {
    
    /// This is the final destination of our shape generation.
    /// It means we can easily search through the entire array and find the location of each and every word we have
    
    static func from(shapes: [ShapeModel], numberOfWordsInEachShape: Int, maxWordId: Int) -> SearchableShapeModel {
        let shapeCount = shapes.count
        let wordCount = numberOfWordsInEachShape * shapeCount
        
        var width: [UInt8] = Array(repeating: 0, count: shapeCount)
        var height: [UInt8] = Array(repeating: 0, count: shapeCount)
        var score: [UInt16] = Array(repeating: 0, count: shapeCount)
        
        var wordId: [UInt8] = Array(repeating: 0, count: wordCount)
        var x: [UInt8] = Array(repeating: 0, count: wordCount)
        var y: [UInt8] = Array(repeating: 0, count: wordCount)
        var isHorizontal: [Bool] = Array(repeating: true, count: wordCount)
        
        let shapesSorted = shapes.sorted { $0.score > $1.score}
        
        // When you see a word in a location then add that to the dictionary of locations that this word appears
        var wordIndex: [UInt8: [Int]] = [:]
        
        var wordPos = 0
        for shapeId in 0..<shapesSorted.count {
            let shape = shapesSorted[shapeId]
            
            width[shapeId] = shape.width
            height[shapeId] = shape.height
            score[shapeId] = shape.score
            
            let placements = shape.placements.sorted { $0.id < $1.id }
            
            for placementId in 0..<placements.count {
                let placement = placements[placementId]
                wordId[wordPos] = placement.id
                x[wordPos] = placement.x
                y[wordPos] = placement.y
                isHorizontal[wordPos] = placement.isHorizontal
                
                // Whenever we have a word put this into the index
                if wordIndex[placement.id] == nil {
                    wordIndex[placement.id] = [wordPos]
                } else {
                    var list = wordIndex[placement.id]!
                    list.append(wordPos)
                    wordIndex[placement.id] = list
                }
                
                
                wordPos += 1
            }
        }
        
        let result = SearchableShapeModel(
            count: shapeCount,
            numberOfWordsInEachShape: numberOfWordsInEachShape,
            wordCount: wordCount,
            score: score,
            width: width,
            height: height,
            wordId: wordId,
            x: x,
            y: y,
            isHorizontal: isHorizontal,
            wordIndex: wordIndex
        )
        
        return result
    }
}

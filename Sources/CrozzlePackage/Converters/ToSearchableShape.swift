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
        
        let shapesSorted = shapes.sorted { $0.s > $1.s}
        
        // When you see a word in a location then add that to the dictionary of locations that this word appears
        var wordIndex: [UInt8: [Int]] = [:]
        
        var wordPos = 0
        for shapeId in 0..<shapesSorted.count {
            let shape = shapesSorted[shapeId]
            
            width[shapeId] = shape.w
            height[shapeId] = shape.h
            score[shapeId] = shape.s
            
            let placements = shape.p.sorted { $0.id < $1.id }
            
            for placementId in 0..<placements.count {
                let placement = placements[placementId]
                wordId[wordPos] = placement.id
                x[wordPos] = placement.x
                y[wordPos] = placement.y
                isHorizontal[wordPos] = placement.isHorizontal
                
                // Whenever we have a word put this into the index
                if wordIndex[placement.id] == nil {
                    // This is the first instance of that wordId being found
                    wordIndex[placement.id] = [shapeId]
                } else {
                    // Take the list of found shapeId and then add another shapeId
                    var list = wordIndex[placement.id]!
                    list.append(shapeId)
                    wordIndex[placement.id] = list
                }
                
                
                wordPos += 1
            }
        }
        
        /// This will tell you for a given word where is the first time in the `searchWordIndexForShapeId` index that it appears
        var searchWordStart:[Int] = Array(repeating: -1, count: maxWordId)
        
        /// How many instances of that word are there in this index
        var searchWordCount:[Int] = Array(repeating: -1, count: maxWordId)
        
        // Each individual shape id that has this word in it
        var searchWordIndexForShapeId: [Int] = Array(repeating: -1, count: numberOfWordsInEachShape * shapeCount)
        
        var searchIndexPos = 0
        for wordId in 0..<maxWordId {
            
            let indexList = wordIndex[UInt8(wordId)]
            
            if indexList != nil {
                
                let shapeForWordCount = indexList!.count
                
                // We have some words to find
                searchWordStart[wordId] = searchIndexPos
                searchWordCount[wordId] = shapeForWordCount
                for i in 0..<shapeForWordCount {
                    searchWordIndexForShapeId[searchIndexPos + i] = indexList![i]
                }
                searchIndexPos += shapeForWordCount
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
            wordToShapeIdIndex: wordIndex,
            searchWordStart: searchWordStart,
            searchWordCount: searchWordCount,
            searchWordIndexForShapeId: searchWordIndexForShapeId
            
            // How do we make the word more searchable than just a dictionar
        )
        
        return result
    }
}

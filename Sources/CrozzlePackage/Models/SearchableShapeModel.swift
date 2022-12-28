//
//  SearchableShapeModel.swift
//  
//
//  Created by Michael Geurtjens on 24/12/2022.
//

import Foundation

/// Our main structure for storing shapes after they have been calculated by the algorithm and we store all shapes of the same number of words in each of these structures.  So a 2x4 and a 3x3 which both have 6 words and so be stored in the same one of these structures.
public struct SearchableShapeModel {
    
    /// How many shapes we have in this structure, should be same as the size of score, width, height
    let count: Int
    
    /// How many words are in each shape.  Its the stride by which we move from one shape to another.  All shapes in this structure have same number of words
    /// so we are storing them in structures of same size to make it quicker and more efficient storage
    let numberOfWordsInEachShape: Int
    
    /// The total number of words in each of the wordId, x, y, isHorizontal arrays.
    let wordCount: Int
    
    /// Score according to crozzle rules of the shape and you will find these scores sorted from highest to lowest as that is how we store our shapes.  So we could do something like search only until the score is no longer above 100
    let score: [UInt16]
    
    /// Width of the rendered shape
    let width: [UInt8]
    
    /// Height of the rendered shape
    let height: [UInt8]
    
    /// This is the word position in the original wordList.  By storing only its location we save space
    let wordId: [UInt8]
    
    /// x position that the word starts from
    let x: [UInt8]
    
    /// y position that the word starts from
    let y: [UInt8]
    
    /// if isHorizontal is true then this word is placed horizontally in the shape else its placed vertically
    let isHorizontal: [Bool]
    
    /// This dictionary can be looked up so if you want to know where each particular word like word 3 is, then look up 3 in the dictionary
    /// and its either meaning that this word has no shape at all
    /// or an array of shapeId, or maybe it should be the absolute value not sure depending on the logic so it could be position within the x,y,isHorizontal arrays, no perhaps shape Id is ok for now.  Should be a good search optimization.
    /// Useful for CPU as its a dictionary
    let wordToShapeIdIndex: [UInt8:[Int]]
    
    
    
    
    // no we could also reserve position 0 for doesnt exist and so we add an extra value for each one
    let searchWordStart: [Int] // If -1 then it means the word does not exist
    
    let searchWordCount: [Int]
    
    let searchWordIndexForShapeId: [Int]
}

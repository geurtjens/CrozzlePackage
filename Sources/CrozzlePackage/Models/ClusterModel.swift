//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 18/12/2022.
//

import Foundation

/// Stores the data that our calculators have found.  Its not quite a shape but what is the ingredients of the shape, including the words and the pattern they are oriented within
public struct ClusterModel {
    
    /// The id of the word that we have found, being the position of the word within the original word list.  If the interlocking block has width=2 and height=2 then there will be four words per shape (stride of 4) and the horizontal will be the first two and the vertical will be the last two.  So horizontal is always first
    public let wordId: [UInt8]
    
    public let outerStart: [UInt8]

    /// The orientation of the words where the interlocks are.  .leading - in the beginning of the word, .trailing - at the end of the word, .middle - all word are involved, .outer - starting somewhere in the middle of the word
    public let patternHorizontal: [ClusterPosition]
    
    public let patternVertical: [ClusterPosition]
    
    /// How many interlocking letters are all clumped together in a continuous fashion and going in the horizontal direction
    public let interlockWidth: Int
    
    /// How many interlocking letters are all clumped together and going in the vertical direction
    public let interlockHeight: Int
    
    /// The number of words that we are storing in this model, so that every shape has the same number of words
    public let stride: Int
    
    /// The number of shapes that where found
    public let size: Int
    
    public func wordArraySize() -> Int {
        return stride * size
    }
    
    public func wordPosX(shapeId: Int, i: Int) -> Int {
        return shapeId * self.stride + i
    }
    
    public func wordPosY(shapeId: Int, i: Int) -> Int {
        return shapeId * self.stride + self.interlockHeight + i
    }
}

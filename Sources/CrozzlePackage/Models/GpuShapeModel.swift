//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 16/12/2022.
//

import Foundation
/// Valid shapes are stored within this structure in a form that can be submitted to GPU.

/// Its important that we know the order that each word was originally provided as that will be the id of each word.
/// We have width and height being one value per shape.
/// We have id, x, y, isHorizontal for each word in any given shape.
/// The stride to work out which words are in which is based on wordCountPerShape.
public struct GpuShapeModel {

    /// All shapes in this structure will have the same number of words as defined in this variable.  It is the stride that we can use to reconstitute the shape
    public let stride: UInt8
    
    /// The total number of shapes that are contained in this object
    public let count: Int
    
    /// Score or value attributed to this shape as it pertains to crozzle rules
    public let score: [UInt16]
    
    /// Each shape stores its width in this array, So the nth shape will have the nth width
    public let width: [UInt8]
    
    /// Each shape stores its height in this array, So the nth shape will have the nth height.
    public let height: [UInt8]
    
    /// This is the array index position that we will find the word
    public let id: [UInt8]
    
    /// The starting position of a word in the shape, in the x direction
    public let x: [UInt8]
    
    /// The starting position of a word in the shape, in the y direction
    public let y: [UInt8]
    
    /// Whether or not the word is placed horizontally and if it isnt then it would be placed vertically
    public let isHorizontal: [Bool]
    
}

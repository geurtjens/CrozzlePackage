//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 16/12/2022.
//

import Foundation

/// Converts an array of shapes into a shape Array
public class ShapeToGpuShapeConverter {
    
    /// For each shape, add its data into an object of arrays, so we can process on a GPU
    /// - Parameters:
    ///   - shapes: Each shape within the array of ShapeModel is a valid shape we calculated
    ///   - wordCount: How many words are in each shape, gives us the stride we need to reconstitute the shapes
    /// - Returns: An object that contains an array for each property of the ShapeModel
    public static func execute(shapes: [ShapeModel], wordCount: Int) -> GpuShapeModel {
        let shapeCount = shapes.count
        
        // Initialize the variables that have only one value per shape
        var width: [UInt8] = Array(repeating: 0, count: shapeCount)
        var height: [UInt8] = Array(repeating: 0, count: shapeCount)
        var score: [UInt16] = Array(repeating:0, count: shapeCount)
        
        let wordElementSize = shapeCount * wordCount
        
        // Initialize the variables that have one value per word in the shape
        
        var id: [UInt8] = Array(repeating: 0, count: wordElementSize)
        var x: [UInt8] = Array(repeating: 0, count: wordElementSize)
        var y: [UInt8] = Array(repeating: 0, count: wordElementSize)
        var isHorizontal: [Bool] = Array(repeating: true, count: wordElementSize)

        // What word position are we up to right now
        var wordPos = -1
        
        // Go to every shape and convert it into our array based solution
        for shapeId in 0..<shapeCount {
            let shape = shapes[shapeId]
            
            // These are populating the arrays that have one value per shape
            width[shapeId] = shape.w
            height[shapeId] = shape.h
            score[shapeId] = shape.s
            
            for wordId in 0..<wordCount {
                // We continue to increase the word pos to place them into the arrays that require one value per word
                wordPos += 1
                
                let placement = shape.p[Int(wordId)]
                id[wordPos] = placement.id
                
                x[wordPos] = placement.x
                y[wordPos] = placement.y
                isHorizontal[wordPos] = placement.isHorizontal
            }
        }
        
        // Now that we have calculated all the arrays then create the object
        let shapeArray = GpuShapeModel(
            stride: UInt8(wordCount),
            count: shapeCount,
            score: score,
            width: width,
            height: height,
            id: id,
            x: x,
            y: y,
            isHorizontal: isHorizontal)
        
        return shapeArray
    }
}

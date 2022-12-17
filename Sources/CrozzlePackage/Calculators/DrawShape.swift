//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 16/12/2022.
//

import Foundation
/// Converts the shape into a text representation of the shape as it would be rendered into a grid
public class DrawShape {
    
    
    /// Render a shape in its own text string.
    /// - Parameters:
    ///   - shape: shape has been calculated by a previous process that was responsible for making it a valid shape
    ///   - wordList: an array of words used when creating the shape, important for knowing the word in each position
    /// - Returns: Creates a string which accurately represents the shape as it could be rendered in a grid apart from having the end of line characters in it.
    public static func draw(shape: ShapeModel, wordList:[String]) -> String {
        
        var result = getInitialShape(width: shape.width, height: shape.height)
        // Then we place each character and convert the array into a string somehow
        for placement in shape.placements {
            
            let startingLocation = getLocation(
                x: placement.x,
                y: placement.y,
                width: shape.width)
            
            result[startingLocation] = "."
            
            let word = wordList[Int(placement.id)]
            
            if placement.isHorizontal {
                
                for i in 0..<word.count {
                    let location = startingLocation + i + 1
                    result[location] = word[i]
                }
                result[startingLocation + word.count + 1] = "."
            } else {
                for i in 0..<word.count {
                    let location = getLocation(
                        x: placement.x,
                        y: placement.y + UInt8(i) + 1,
                        width: shape.width)
                    result[location] = word[i]
                }
                let lastLocation = getLocation(
                    x: placement.x,
                    y: placement.y + UInt8(word.count + 1),
                    width: shape.width)
                
                result[lastLocation] = "."
            }
        }

        return String(result)
    }
    
    /// Create an array that is the right size to hold the shape and place end of line characters where they need to be
    /// - Parameters:
    ///   - width: width of shape
    ///   - height: height of shape
    /// - Returns: An array of characters which contains end of line characters and correct size
    public static func getInitialShape(width: UInt8, height: UInt8) -> [Character] {
        let size = sizeOfShape(width: width, height: height)
        
        var result: [Character] = Array(repeating: " ", count: size)
        
        var position = 0
        for y in 0..<height-1 {
            if y == 0 {
                position += Int(width)
            } else {
                position += Int(width) + 1
            }
            result[position] = "\n"
        }
        return result
    }
    
    
    /// Calculate the character location.  x,y assumes a 2d datastructure but our data structure is an array of characters
    /// - Parameters:
    ///   - x: x position of the letter to be placed into the grid, given the grid is a text string
    ///   - y: y position of the letter we want to place into the grid, given the grid is a text string
    ///   - width: the known width is needed to calculate where the letter should go
    /// - Returns: Location within the string that we must place our letter
    public static func getLocation(x: UInt8, y: UInt8, width: UInt8) -> Int {
        return (Int(width) + 1) * Int(y) + Int(x)
    }
    
    
    /// Determines how many bytes are required to contain the shape
    /// - Parameters:
    ///   - width: The width of the shape that was calculated when the shape was created
    ///   - height: The height of the shape that was calculated when the shape was created
    /// - Returns: size of the shape if it is rendered
    public static func sizeOfShape(width: UInt8, height: UInt8) -> Int {
        let size = Int(width+1) * Int(height) - 1
        return size
    }
}

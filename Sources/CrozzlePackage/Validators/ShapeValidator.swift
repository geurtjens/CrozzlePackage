//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 31/12/2022.
//

import Foundation
public class ShapeValidator {
    
    public static func Execute(shape: ShapeModel, wordList: [String]) -> Bool {
        let text = DrawShape.draw(shape: shape, wordList: wordList)
        
        
        let sizeOfShape = DrawShape.sizeOfShape(width: shape.width, height: shape.height)
        
        if text.count != sizeOfShape {
            print("size of shape wrong")
            return false
        }
        // For each placement check that the valid word is within the text
        
        for placement in shape.placements {
            let word = wordList[Int(placement.id)]
            // This is where the word should start
            let startingLocation = DrawShape.getLocation(x: placement.x, y: placement.y, width: shape.width)
            
            if text[startingLocation] != "." {
                print("start of word \(word) invalid, expecting '.' found '\(text[startingLocation]).")
                return false
            }
            
            
            if placement.isHorizontal {
                for i in 0..<word.count {
                    let textPos = startingLocation + i + 1
                    if text[textPos] != word[i] {
                        print("vertical word '\(word)' has letter position \(i) invalid expecting '\(word[i])' found '\(text[textPos])'.")
                        return false
                    }
                }
                let lastPos = startingLocation + word.count + 1
                if text[lastPos] != "." {
                    print("end of horizontal word '\(word)' invalid, expecting '.' found '\(text[lastPos])'.")
                    return false
                }
            } else {
                for i in 0..<word.count {
                    
                    let textPos = DrawShape.getLocation(x: placement.x,y: placement.y + UInt8(i) + 1,width: shape.width)
                    if text[textPos] != word[i] {
                        print("vertical word '\(word)' has letter position \(i) invalid expecting '\(word[i])' found '\(text[textPos])'.")
                        return false
                    }
                    
                    
                }
                let lastPos = DrawShape.getLocation(x: placement.x, y: placement.y + UInt8(word.count + 1), width: shape.width)
                
                if text[lastPos] != "." {
                    print("end of vertical word '\(word) invalid, expecting '.', found '\(text[lastPos])'.")
                    return false
                }
            }
        }
        return true
    }
}

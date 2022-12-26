//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 4/12/2022.
//

import Foundation
/// Everything we need to create the edge shapes
public class EdgeCalculator {
    
    /// provides edges in both directions and that fit within the score and size limits
    public static func findValidEdges(fromWordList wordList: [String], scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [EdgeModel] {
        let edges = EdgeCalculator.findEdges(fromWordList: wordList)
        
        var validEdges: [EdgeModel] = []
        for edge in edges {
            
            let shape = EdgeToShapeConverter.toShape(fromEdge: edge, usingWords: wordList, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            if shape != nil {
                validEdges.append(edge)
                
                let reversedEdge = EdgeModel(
                    h:edge.v,
                    hPosFromStart:edge.vPosFromStart,
                    hPosFromEnd: edge.vPosFromEnd,
                    v:edge.h,
                    vPosFromStart:edge.hPosFromStart,
                    vPosFromEnd: edge.hPosFromEnd)
                
                validEdges.append(reversedEdge)
            }
        }
        return validEdges
    }
    
    
    /// Finds all edges found within an array of words
    /// - Parameter wordList: A list of words
    /// - Returns: A list of valid edges
    public static func findEdges(fromWordList wordList: [String]) -> [EdgeModel] {
        let wordListSize = wordList.count
        
        var result: [EdgeModel] = []
        
        var matchingSize = 0;
        
        for cycle in 0...1 {
            
            if cycle == 1 {
                result.reserveCapacity(matchingSize)
            }
        
            for hid in 0..<wordListSize {
                
                let horizontalWord = wordList[hid]
                
                for horizontalLetter in 0..<horizontalWord.count {
                    
                    for vid in (hid + 1)..<wordListSize {
                        
                        let verticalWord = wordList[vid];
                        
                        for verticalLetter in 0..<verticalWord.count {
                            if verticalWord[verticalLetter] == horizontalWord[horizontalLetter] {
                                if (cycle == 0) {
                                    matchingSize += 1
                                }
                                else {
                                    result.append(EdgeModel(
                                        h: UInt8(hid),
                                        hPosFromStart: UInt8(horizontalLetter),
                                        hPosFromEnd: UInt8(horizontalWord.count - horizontalLetter - 1),
                                        v: UInt8(vid),
                                        vPosFromStart: UInt8(verticalLetter),
                                        vPosFromEnd: UInt8(verticalWord.count - verticalLetter - 1)))
                                }
                            }
                        }
                    }
                }
            }
        }
        return result
    }
}

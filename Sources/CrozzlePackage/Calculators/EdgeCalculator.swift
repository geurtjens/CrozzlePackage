//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 4/12/2022.
//

import Foundation
/// Everything we need to create the edge shapes
public class EdgeCalculator {
    
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
        
            for wordId1 in 0..<wordListSize {
                
                let word1 = wordList[wordId1]
                
                
                for letterPosition1 in 0..<word1.count {
                    
                    let letter1 = word1[letterPosition1];
                
                    for wordId2 in (wordId1 + 1)..<wordListSize {
                        
                        let word2 = wordList[wordId2];
                        
                        
                        for letterPosition2 in 0..<word2.count {
                            if (word2[letterPosition2] == letter1) {
                                if (cycle == 0) {
                                    matchingSize += 1
                                }
                                else {
                                    
                                    result.append(EdgeModel(
                                            word1: UInt8(wordId1),
                                        letterPosition1: UInt8(letterPosition1), word2: UInt8(wordId2),
                                        letterPosition2: UInt8(letterPosition2)))
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

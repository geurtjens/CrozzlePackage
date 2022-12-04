//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 4/12/2022.
//

import Foundation
class EdgeCalculator {
    
    
    static func edgeToShape(wordList: [String], edges:[EdgeModel]) -> [ShapeModel] {
        var result: [ShapeModel] = []
        result.reserveCapacity(edges.count)
        
        for edge in edges {
            let word1 = wordList[Int(edge.word1)]
            let word2 = wordList[edge.word2]
            
            let width = UInt8(word1.count) + 2
            let height = UInt8(word2.count) + 2
            
            let shape = ShapeModel(
                width:width,
                height:height,
                wordIdArray:[UInt8(edge.word1), UInt8(edge.word2)],
                wordOrientationArray: [true, false],
                xStartArray:[0 ,edge.letterPosition1 + 1],
                yStartArray:[edge.letterPosition2 + 1, 0]
            )
            result.append(shape)
        }
        return result
    }
    
    static func findEdges(wordList: [String]) -> [EdgeModel] {
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
                                            word1: wordId1,
                                        letterPosition1: UInt8(letterPosition1), word2: wordId2,
                                        letterPosition2: UInt8(letterPosition2)))
                                }
                            }
                        }
                    }
                }
            }
        }
        return result;
    };
}

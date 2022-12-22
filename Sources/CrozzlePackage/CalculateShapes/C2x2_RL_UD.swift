//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2022.
//

import Foundation
public class C2x2_RL_UD {
    public static func Execute(W: WordModelSOA) -> ClusterModel {
        
        let interlockWidth = 2
        let interlockHeight = 2
        let wordCount = W.wordCount
        let stride = 4
        
        var wordId: [UInt8] = [] // Stores the word patterns that meet the criteria we are seeking
        
        var shapeCount: Int = 0
        var index = 0
        
        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
            }
            
            for up1 in 0..<wordCount {
                
                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")
                    
                    for right1 in 0..<wordCount {
                        
                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.End[up1][1] &&
                            W.Id[right1] != W.Id[up1]) {
                            //print("right1:\(W.Start[right1])")
                            
                            for down2 in 0..<wordCount {
                                
                                if (W.Len[down2] >= interlockHeight &&
                                    W.Start[down2][0] == W.Start[right1][1] &&
                                    W.Id[down2] != W.Id[right1] &&
                                    W.Id[down2] != W.Id[up1]) {
                                    //print("down2:\(W.Start[down2])")
                                    
                                    for left2 in 0..<wordCount {
                                        
                                        if (W.Len[left2] >= interlockWidth &&
                                            W.End[left2][1] == W.End[up1][0] &&
                                            W.End[left2][0] == W.Start[down2][1] &&
                                            W.Id[left2] != W.Id[down2] &&
                                            W.Id[left2] != W.Id[right1] &&
                                            W.Id[left2] != W.Id[up1]) {
                                            //print("left2:\(W.Start[left2])")
                                                  
                                            if phase == 0 {
                                                shapeCount += 1
                                            }
                                            else {
                                                ClusterHelper.AddWords(
                                                    index: &index,
                                                    wordId: &wordId,
                                                    wordsToAdd:[right1, left2, up1, down2])   
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return RemoveDuplicates.RemoveDuplicates2x2(cluster: ClusterModel(
            wordId: wordId,
            outerStart: [],
            patternHorizontal: [.trailing, .leading],
            patternVertical: [.leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount))
    }
    
}

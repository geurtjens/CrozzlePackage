//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 18/12/2022.
//

import Foundation
public class C2x2_LR_UD {
    
    public static func Execute(W: WordModelSOA) -> ClusterModel {
        let wordCount = W.wordCount
        let interlockWidth = 2
        let interlockHeight = 2
        let stride = interlockWidth + interlockHeight // The number of words in the shape
        
        var index = 0 // This is the pointer to where we should put the next set of words in the shape
        var shapeCount = 0 // The number of shapes we find
        var wordId: [UInt8] = [] // Stores the word patterns that meet the criteria we are seeking
        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {
                
                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")
                    
                    for left1 in 0..<wordCount {
                        
                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][1] == W.End[up1][1] &&
                            W.Id[left1] != W.Id[up1]) {
                            //print("left1:\(W.Start[left1])")
                            
                            for down2 in 0..<wordCount {
                                
                                if (W.Len[down2] >= interlockHeight &&
                                    W.Start[down2][0] == W.End[left1][0] &&
                                    W.Id[down2] != W.Id[left1] &&
                                    W.Id[down2] != W.Id[up1]) {
                                    //print("down2:\(W.Start[down2])")
                                    
                                    for right2 in 0..<wordCount {
                                        
                                        if (W.Len[right2] >= interlockWidth &&
                                            W.Start[right2][0] == W.End[up1][0] &&
                                            W.Start[right2][1] == W.Start[down2][1] &&
                                            W.Id[right2] != W.Id[down2] &&
                                            W.Id[right2] != W.Id[left1] &&
                                            W.Id[right2] != W.Id[up1]) {
                                            //print("right2:\(W.Start[right2])")
                                            
                                            if phase == 0 {
                                                shapeCount += 1
                                            }
                                            else {
                                                ClusterHelper.AddWords(
                                                    index: &index,
                                                    wordId: &wordId,
                                                    wordsToAdd:[left1, right2, up1, down2])
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
            patternHorizontal: [.leading, .trailing],
            patternVertical: [.leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount))
    }




}



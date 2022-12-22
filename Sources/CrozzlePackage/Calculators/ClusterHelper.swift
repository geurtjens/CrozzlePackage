//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2022.
//

import Foundation
public class ClusterHelper {
    public static func AddWords(index: inout Int, wordId: inout [UInt8], wordsToAdd: [Int]) {
        for i in 0..<wordsToAdd.count {
            wordId[index + i] = UInt8(wordsToAdd[i])
        }
        index += wordsToAdd.count
    }
}

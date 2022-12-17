//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 17/12/2022.
//

import Foundation
/// The gpu has everything fixed length arrays so we place the words in a continuous array
public struct GpuWordList {
    /// An array of characters containing the letters of the word.  We know the starting position of the word within this array using start and the length of the word using length
    public let words: [UInt8]
    
    /// Starting position of each word.  So if you want to know the starting location of word 4 then look up start[3] to discover where word 4 begins
    public let start: [UInt16]
    
    /// The length of each word.  So if you want to know the length of word 4 then look up length[3]
    public let length: [UInt8]
}

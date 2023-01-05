//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 18/12/2022.
//

import Foundation

/// We have laid out the words in the word list into a format that can be easily enquired upon when using a gpu or cpu to simplify the algorithms that use this reference data.
public struct WordModelSOA {
    
    /// How many words are in the list
    public let wordCount: Int
    
    /// How many letters are in all the words
    public let letterCount: Int
    
    /// This is just an incrementing number but it represents the word as it appears in the original wordList.  It is a UInt8
    public let Id : [UInt8]
    
    /// The length of each word
    public let Len: [UInt8]
    
    /// The word that is in this position in the array
    public let Start: [String]
    
    /// The word reversed that is in this position in the array
    public let End:[String]
    
    /// The location within the letter array that this word begins
    public let WordStart:[UInt16]
    
    /// All of the letters in all of the words stuck together
    public let BeginsWith:[UInt8]
    
    /// The words are still laid out by their sequence but the letters per word have been reversed.  So ZION forward will have NOIZ backwards
    public let EndsWith:[UInt8]
    
    public init(words:[String]) {
        
        let _wordCount = words.count
        
        self.wordCount = words.count
        
        var _wordId : [UInt8] = Array(repeating:0,count:_wordCount)
        var _length : [UInt8] = Array(repeating:0,count:_wordCount)
        var _text:[String] = []
        var _endText:[String] = []
        var _start:[UInt16] = Array(repeating:0, count:_wordCount)
        
        var _letterCount = 0
        for i in 0..<_wordCount {
            
            let word = words[i]
            
            _wordId[i] = UInt8(i)
            _length[i] = UInt8(word.count)
            _text.append(word)
            _endText.append(String(word.reversed()))
            _letterCount += word.count
                            
        }
        self.Id = _wordId
        self.Len = _length
        self.Start = _text
        self.End = _endText
        self.letterCount = _letterCount
        
        var _s:[UInt8] = Array(repeating:127, count:_letterCount)
        var _e:[UInt8] = Array(repeating:127, count:_letterCount)
        var startingPos = 0
        for i in 0..<_wordCount {
            _start[i] = UInt16(startingPos)
            let word = words[i]
            let reversed = String(word.reversed())
            let wordLength = word.count
            for letterId in 0..<word.count {
                
                let letter : Character = word[letterId]
                _s[startingPos+letterId] = letter.asciiValue!
                
                let letterReversed : Character = reversed[letterId]
                _e[startingPos + letterId] = letterReversed.asciiValue!
            }
            startingPos += wordLength
        }
        self.BeginsWith = _s
        self.EndsWith = _e
        self.WordStart = _start
    }
}

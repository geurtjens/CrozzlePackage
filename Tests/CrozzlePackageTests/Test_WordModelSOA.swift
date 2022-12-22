//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 19/12/2022.
//

import Foundation
import XCTest
@testable import CrozzlePackage

final class Test_WordModelSOA: XCTestCase {
    
    let wordList: [String] = WordListExamples.getWordList()
    
    func test_initialization() throws {
        let result = WordModelSOA(words:wordList)
        XCTAssertEqual(result.wordCount,91)
        XCTAssertEqual(result.letterCount, 602)
        
        for i in 0..<result.wordCount {
            
            let word = wordList[i]
            
            let reversed = String(word.reversed())
            
            XCTAssertEqual(result.Start[i], word)
            XCTAssertEqual(result.End[i], reversed)
            
            
            // We expect the id should be an every increasing number starting from 0
            XCTAssertEqual(result.Id[i],UInt8(i))
            
            // We expect the length variable should be the length of each word in the list
            XCTAssertEqual(result.Len[i], UInt8(word.count))
        }
    }
}

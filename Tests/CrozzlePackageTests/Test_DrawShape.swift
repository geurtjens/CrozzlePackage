//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 17/12/2022.
//

import Foundation
import XCTest
@testable import CrozzlePackage

final class Test_DrawShape: XCTestCase {
    
    let wordList = WordListExamples.getWordList()
    
    func test_draw() throws {
        
        let shape = ShapeModel(s: 84, w: 6, h: 7, p: [
            PlacementModel(id: 0, x: 0, y: 2, isHorizontal: true),
            PlacementModel(id: 1, x: 1, y: 0, isHorizontal: false)
        ] )
        
        let result = DrawShape.draw(shape: shape, wordList: wordList)
        print("")
        print(String(result))
        var expected = ""
        expected += " .    \n"
        expected += " A    \n"
        expected += ".ZION.\n"
        expected += " U    \n"
        expected += " R    \n"
        expected += " E    \n"
        expected += " .    "
        XCTAssertEqual(result, expected)
    }
}

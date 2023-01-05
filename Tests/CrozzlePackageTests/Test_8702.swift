//
//  Test_8702.swift
//  
//
//  Created by Michael Geurtjens on 5/1/2023.
//

import XCTest
@testable import CrozzlePackage
final class Test_8702: XCTestCase {


    func testExample() throws {
        let words = WordListExamples.Words_8702()
        let w = WordModelSOA(words: words)
        
        // This combination is failing when I try to generate the shape so lets reproduce the error and try to diagnose what is going on
        let result = ToShape.from(cluster: C3x3_OML_UDU.Execute(W: w, wordCount: words.count), wordList: w, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let expectedText = "" +
        "   .      \n" +
        "   P      \n" +
        "   A .    \n" +
        "   Y U    \n" +
        "   M.N    \n" +
        ".CREDITOR.\n" +
        "  .NET.   \n" +
        ".NOTES.   \n" +
        "   .D.    \n" +
        "    .     "
        //print(expectedText)
        
        let shape = result[0]
        
        
        
        XCTAssertEqual(shape.w, 10)
        XCTAssertEqual(shape.h, 10)
        
        let text = DrawShape.draw(shape: shape, wordList: words)
        //print(text)
        
        //print(DrawShape.flatDraw(text: expectedText))
        //print(DrawShape.flatDraw(text: text))
        
        XCTAssertEqual(text,expectedText)
        XCTAssertEqual(result.count,10)
        
//        for shape in result {
//            let text = DrawShape.draw(shape: shape, wordList: words)
//            print(text)
//        }
    }

   

}

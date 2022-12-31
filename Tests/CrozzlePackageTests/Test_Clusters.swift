//
//  Test_Clusters.swift
//  
//
//  Created by Michael Geurtjens on 31/12/2022.
//

import XCTest
@testable import CrozzlePackage
final class Test_Clusters: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let scoreMin = 0
        let widthMax = 17
        let heightMax = 12
        let wordList = WordListExamples.getWordList()
        
        let w = WordModelSOA(words: wordList)
        
        let c2x2 = C2x2.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x3 = C2x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x4 = C2x4.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x5 = C2x5.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x6 = C2x6.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let c3x3 = C3x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x4 = C3x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x5 = C3x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x6 = C3x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        
        
        TestingUtilities.checkAllShapes(shapes: c2x2, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: c2x3, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: c2x4, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: c2x5, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: c2x6, wordList: wordList)
        
        TestingUtilities.checkAllShapes(shapes: c3x3, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: c3x4, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: c3x5, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: c3x6, wordList: wordList)
    }

}

//
//  Test_OpenDonutCalculator.swift
//  
//
//  Created by Michael Geurtjens on 28/12/2022.
//

import XCTest
@testable import CrozzlePackage
final class Test_OpenDonutCalculator: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTopRight() throws {
        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        
        let result = OpenDonutCalculator.TopRight(edges: edges, words: wordList, interlockWidth: 3, interlockHeight: 4, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let shape = result[0]
        XCTAssertEqual(shape.width, 13)
        XCTAssertEqual(shape.height, 7)
        XCTAssertEqual(shape.score, 144)
        XCTAssertEqual(shape.placements.count,4)
        
        let top = shape.placements[0]
        XCTAssertEqual(wordList[Int(top.id)], "GLAZE")
        XCTAssertEqual(top.id, 25)
        XCTAssertEqual(top.x, 0)
        XCTAssertEqual(top.y, 1)
        XCTAssertTrue(top.isHorizontal)
        
        let bottom = shape.placements[1]
        XCTAssertEqual(wordList[Int(bottom.id)], "TWENTYFIFTH")
        XCTAssertEqual(bottom.id, 27)
        XCTAssertEqual(bottom.x, 0)
        XCTAssertEqual(bottom.y, 4)
        XCTAssertTrue(bottom.isHorizontal)
        
        let left = shape.placements[2]
        XCTAssertEqual(wordList[Int(left.id)], "ZION")
        XCTAssertEqual(left.id, 0)
        XCTAssertEqual(left.x, 4)
        XCTAssertEqual(left.y, 0)
        XCTAssertFalse(left.isHorizontal)
        
        let right = shape.placements[3]
        XCTAssertEqual(wordList[Int(right.id)], "TOYS")
        XCTAssertEqual(right.id, 2)
        XCTAssertEqual(right.x, 6)
        XCTAssertEqual(right.y, 1)
        XCTAssertFalse(right.isHorizontal)
        
        let expectedText = "" +
        "    .        \n" +
        ".GLAZE.      \n" +
        "    I T      \n" +
        "    O O      \n" +
        ".TWENTYFIFTH.\n" +
        "    . S      \n" +
        "      .      "
        
        let text = DrawShape.draw(shape: result[0], wordList: wordList)
        XCTAssertEqual(text, expectedText)
        print(text)
        
        for shape in result {
            let text2 = DrawShape.draw(shape:shape, wordList: wordList)
            print(text2)
        }
    }
    
    
    func testBottomRight() throws {
        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        
        let result = OpenDonutCalculator.BottomRight(edges: edges, words: wordList, interlockWidth: 3, interlockHeight: 4, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let shape = result[0]
        XCTAssertEqual(shape.width, 10)
        XCTAssertEqual(shape.height, 10)
        XCTAssertEqual(shape.score, 54)
        XCTAssertEqual(shape.placements.count,4)
        
        let top = shape.placements[0]
        XCTAssertEqual(wordList[Int(top.id)], "FAMILY")
        XCTAssertEqual(top.id, 15)
        XCTAssertEqual(top.x, 2)
        XCTAssertEqual(top.y, 2)
        XCTAssertTrue(top.isHorizontal)
        
        let bottom = shape.placements[1]
        XCTAssertEqual(wordList[Int(bottom.id)], "AZURE")
        XCTAssertEqual(bottom.id, 1)
        XCTAssertEqual(bottom.x, 0)
        XCTAssertEqual(bottom.y, 5)
        XCTAssertTrue(bottom.isHorizontal)
        
        let left = shape.placements[2]
        XCTAssertEqual(wordList[Int(left.id)], "NAZARETH")
        XCTAssertEqual(left.id, 6)
        XCTAssertEqual(left.x, 4)
        XCTAssertEqual(left.y, 0)
        XCTAssertFalse(left.isHorizontal)
        
        let right = shape.placements[3]
        XCTAssertEqual(wordList[Int(right.id)], "ZION")
        XCTAssertEqual(right.id, 0)
        XCTAssertEqual(right.x, 6)
        XCTAssertEqual(right.y, 0)
        XCTAssertFalse(right.isHorizontal)
        
        let expectedText = "" +
        "    . .   \n" +
        "    N Z   \n" +
        "  .FAMILY.\n" +
        "    Z O   \n" +
        "    A N   \n" +
        ".AZURE.   \n" +
        "    E     \n" +
        "    T     \n" +
        "    H     \n" +
        "    .     "
        
        
        
        let text = DrawShape.draw(shape: result[0], wordList: wordList)
        XCTAssertEqual(text, expectedText)
        print(text)
        
        
        for shape in result {
            let text2 = DrawShape.draw(shape:shape, wordList: wordList)
            print(text2)
        }
    }
    
    func testExample() throws {
        
        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let result = OpenDonutCalculator.Execute(edges: edges, words: wordList, interlockWidth: 3, interlockHeight: 4, scoreMin: 0, widthMax: 17, heightMax: 12)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


//
//  Test_Cluster2x2_LeftRight_UpDown.swift
//  
//
//  Created by Michael Geurtjens on 19/12/2022.
//

import XCTest
@testable import CrozzlePackage
final class Test_C2x2_LR_UD: XCTestCase {
    let wordList = WordListExamples.getWordList()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testCount() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x2_LR_UD.Execute(W: wordModel)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 256)
    }
    func testDraw() throws {
        
        let wordModel = WordModelSOA(words: wordList)
        
        let result = C2x2_LR_UD.Execute(W: wordModel)
        
        let shapes = ToShape.from(cluster: result, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 13)
        
        for shape in shapes {
            let text = DrawShape.draw(shape: shape, wordList: wordList)
            print(text)
        }
    }
        
    func testExample() throws {
        
        let wordModel = WordModelSOA(words: wordList)
        
        let result = C2x2_LR_UD.Execute(W: wordModel)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let w0 = Int(result.wordId[0])
        let w1 = Int(result.wordId[1])
        let w2 = Int(result.wordId[2])
        let w3 = Int(result.wordId[3])
        
        XCTAssertEqual(w0, 9)
        XCTAssertEqual(w1, 6)
        XCTAssertEqual(w2, 0)
        XCTAssertEqual(w3, 28)
        
        let word0 = wordList[w0]
        let word1 = wordList[w1]
        let word2 = wordList[w2]
        let word3 = wordList[w3]
        
        XCTAssertEqual(word0, "SNOW")
        XCTAssertEqual(word1, "NAZARETH")
        XCTAssertEqual(word2, "ZION")
        XCTAssertEqual(word3, "WALNUT")
        
        print(word0, word1, word2, word3)
        
        let shapes = ToShape.from(cluster: result, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 256)
        
        let shape = shapes[0]
        
        XCTAssertEqual(shape.width, 12)
        XCTAssertEqual(shape.height, 10)
        XCTAssertEqual(shape.score, 74)
        XCTAssertEqual(shape.placements.count, 4)
        
        let h1 = shape.placements[0]
        let h2 = shape.placements[1]
        let v1 = shape.placements[2]
        let v2 = shape.placements[3]
        
        XCTAssertEqual(h1.id, 9)
        XCTAssertEqual(h1.x, 0)
        XCTAssertEqual(h1.y, 3)
        XCTAssertTrue(h1.isHorizontal)
        
        XCTAssertEqual(h2.id, 6)
        XCTAssertEqual(h2.x, 2)
        XCTAssertEqual(h2.y, 4)
        XCTAssertTrue(h2.isHorizontal)
        
        XCTAssertEqual(v1.id, 0)
        XCTAssertEqual(v1.x, 3)
        XCTAssertEqual(v1.y, 0)
        XCTAssertFalse(v1.isHorizontal)
        
        XCTAssertEqual(v2.id, 28)
        XCTAssertEqual(v2.x, 4)
        XCTAssertEqual(v2.y, 2)
        XCTAssertFalse(v2.isHorizontal)
        
        let expected =
            "   .        \n" +
            "   Z        \n" +
            "   I.       \n" +
            ".SNOW.      \n" +
            "  .NAZARETH.\n" +
            "   .L       \n" +
            "    N       \n" +
            "    U       \n" +
            "    T       \n" +
            "    .       "

        
        
        let text = DrawShape.draw(shape: shape, wordList: wordList)
        print(("\"" + text + "\"").replacingOccurrences(of: "\n", with: "^"))
        print(("\"" + expected + "\"").replacingOccurrences(of: "\n", with: "^"))
        
        XCTAssertEqual(text, expected)

        
        //print(result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

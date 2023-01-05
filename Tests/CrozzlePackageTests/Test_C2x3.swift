//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2022.
//

import Foundation
import XCTest
@testable import CrozzlePackage
final class Test_C2x3: XCTestCase {
    
    func test_C2x3_LRL_MO() throws {
        
        // alternative words are VAN, CAGE, ARTISTS, ACT, GYMNAST
        let wordList = ["CAINE", "ZSA", "LIZA", "ALAN", "SIDNEY"] //8807
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x3_LRL_MO.Execute(W: wordModel, wordCount: wordModel.wordCount)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 1)
        
        let expectedText = "" +
        "    .     \n" +
        "   .C     \n" +
        ".LIZA.    \n" +
        "  .SIDNEY.\n" +
        ".ALAN.    \n" +
        "   .E     \n" +
        "    .     "
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        XCTAssertEqual(text, expectedText)
        print(text)
    }
    
    func test_C2x3_RLR_OM() throws {
        let wordList = ["NOVAK", "MEL", "OMAR", "STEVE", "AL"] //8807
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x3_RLR_OM.Execute(W: wordModel, wordCount: wordModel.wordCount)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 1)
        
        let expectedText = "" +
                    "    .    \n" +
                    "    N.   \n" +
                    "   .OMAR.\n" +
                    ".STEVE.  \n" +
                    "   .AL.  \n" +
                    "    K.   \n" +
                    "    .    "
      
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        XCTAssertEqual(text, expectedText)
        print(text)
    }
    func test_C2x3_RLR_DU() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x3_RLR_DU.Execute(W: wordModel, wordCount: wordModel.wordCount)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 56)
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        print(text)
    }
    
    func test_C2x3_RLR_UD() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x3_RLR_UD.Execute(W: wordModel, wordCount: wordModel.wordCount)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 20)
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        print(text)
    }
    
    func test_C2x3_LRL_DU() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x3_LRL_DU.Execute(W: wordModel, wordCount: wordModel.wordCount)
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 64)
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        print(text)
    }
    
    func test_C2x3_LRL_UD() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x3_LRL_UD.Execute(W: wordModel, wordCount: wordModel.wordCount)
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 152)
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        print(text)
    }
    
    
    
    func test_C2x4_RLRL_DU() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x4_RLRL_DU.Execute(W: wordModel, wordCount: wordModel.wordCount)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 18)
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        print(text)
    }
    
    func test_C2x4_RLRL_UD() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x4_RLRL_UD.Execute(W: wordModel, wordCount: wordModel.wordCount)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 0)
        
//        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
//        print(text)
    }
    
    func test_C2x4_LRLR_DU() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x4_LRLR_DU.Execute(W: wordModel, wordCount: wordModel.wordCount)
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 19)
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        print(text)
    }
    
    func test_C2x4_LRLR_UD() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x4_LRLR_UD.Execute(W: wordModel, wordCount: wordModel.wordCount)
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 6)
        
        let text = DrawShape.draw(shape:shapes[0], wordList: wordList)
        print(text)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func testCount() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x3_LRL_DU.Execute(W: wordModel, wordCount: wordModel.wordCount)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 64)
//        for shape in shapes {
//            let text = DrawShape.draw(shape: shape, wordList: wordList)
//            print(text)
//        }
        
        let shape = shapes[0]
        
        XCTAssertEqual(shape.s,106)
        XCTAssertEqual(shape.w, 17)
        XCTAssertEqual(shape.h, 11)
        
        let expectedText = "" +
            "          .      \n" +
            "          P      \n" +
            "          A      \n" +
            "          R      \n" +
            "         .C      \n" +
            " .OPENHOUSE.     \n" +
            "        .ALMONDS.\n" +
            ".SANTACLAUS.     \n" +
            "         C.      \n" +
            "         E       \n" +
            "         .       "
        
        
        
            let text = DrawShape.draw(shape: shape, wordList: wordList)
            XCTAssertEqual(text, expectedText)
        
            let h1 = Int(shape.p[0].id)
            let h2 = Int(shape.p[1].id)
            let h3 = Int(shape.p[2].id)
            
            let v1 = Int(shape.p[3].id)
            let v2 = Int(shape.p[4].id)
            
            let hword1 = wordList[h1]
            let hword2 = wordList[h2]
            let hword3 = wordList[h3]
            let vword1 = wordList[v1]
            let vword2 = wordList[v2]
            print(hword1, hword2, hword3)
            print(vword1, vword2)

            print(text)
        
    }
}

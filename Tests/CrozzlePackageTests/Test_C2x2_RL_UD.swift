//
//  Test_Cluster2x2_RightLeft_UpDown.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2022.
//

import XCTest
@testable import CrozzlePackage
final class Test_C2x2_RL_UD: XCTestCase {

    func testCount() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x2_RL_UD.Execute(W: wordModel)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 97)
    }
    
    
    func testExample() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let result = C2x2_RL_UD.Execute(W: wordModel)
        
        let shapes = ToShape.from(cluster: result, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 97)
        for shape in shapes {
            let text = DrawShape.draw(shape: shape, wordList: wordList)
            print(text)
        }
    }
}

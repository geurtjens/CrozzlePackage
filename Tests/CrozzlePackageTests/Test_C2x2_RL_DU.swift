//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2022.
//

import Foundation
import XCTest
@testable import CrozzlePackage
final class Test_C2x2_RL_DU: XCTestCase {
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCount() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x2_RL_DU.Execute(W: wordModel)
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 446)
    }
    
    func testExecute() throws {
        
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x2_RL_DU.Execute(W: wordModel)
        
        
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(shapes.count, 446)
//        for shape in shapes {
//            let text = DrawShape.draw(shape: shape, wordList: wordList)
//            print(text)
//        }
    }
}

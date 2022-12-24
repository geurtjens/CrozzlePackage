//
//  Test_SearchableShapeModel.swift
//  
//
//  Created by Michael Geurtjens on 24/12/2022.
//

import XCTest
@testable import CrozzlePackage
final class Test_SearchableShapeModel: XCTestCase {

    

    func testExample() throws {
        
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let cluster = C2x4_LRLR_UD.Execute(W: wordModel, wordCount: wordModel.wordCount)
        let shapes = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 6)
        
        for shape in shapes {
            print(DrawShape.draw(shape:shape, wordList: wordList))
        }
        
        let result = ToSearchableShape.from(shapes: shapes, numberOfWordsInEachShape: 6, maxWordId: wordList.count)
        
    }
 
}

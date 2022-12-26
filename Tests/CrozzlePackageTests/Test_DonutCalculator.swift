//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 25/12/2022.
//

import Foundation
import Foundation
import XCTest
@testable import CrozzlePackage
final class Test_DonutCalculator: XCTestCase {
    
    // This will contain all edges which havent yet been limited by the size constraint
    func test_Donut3x6() throws {
        

        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let donutModel = DonutCalculator.ExecuteEdges(edges: edges, wordList: wordList, interlockWidth: 5, interlockHeight: 6, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let shapes = DonutToShapeConverter.toShape(fromDonut: donutModel, usingWords: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(donutModel.shapeCount,65081)
        
        for shape in shapes {
            
            let text = DrawShape.draw(shape: shape, wordList: wordList)
            print(text)
        }
    }
}

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
        
// This fails the test because we have a few badly calculated shapes.  Buts that for another day.
        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let shapes = DonutCalculator.ExecuteEdges(edges: edges, wordList: wordList, interlockWidth: 5, interlockHeight: 6, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(shapes.count,19577)
        
        var invalidShapeCount = 0
        for shape in shapes {
            
            let text = DrawShape.draw(shape: shape, wordList: wordList)
            
            let isValid = ShapeValidator.Execute(shape: shape, wordList: wordList)
            if isValid == false {
                print(text)
                invalidShapeCount += 1
            }
        }
        XCTAssertEqual(invalidShapeCount, 0)
    }
    
    func test_Performance() throws {
        measure {
            let wordList = WordListExamples.getWordList()
            
            let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
            
            let _ = DonutCalculator.ExecuteEdges(edges: edges, wordList: wordList, interlockWidth: 3, interlockHeight: 6, scoreMin: 0, widthMax: 17, heightMax: 12)
        }
    }
}

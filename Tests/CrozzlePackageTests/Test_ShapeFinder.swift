//
//  Test_ShapeFinder.swift
//  
//
//  Created by Michael Geurtjens on 24/12/2022.
//

import XCTest
@testable import CrozzlePackage
final class Test_ShapeFinder: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let result = ShapeFinder.Execute(words: WordListExamples.getWordList(), scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(result.count,5)
        
        var totalShapes = 0
        for item in result {
            totalShapes += item.count
        }
        
        XCTAssertEqual(totalShapes, 11937)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // 172 seconds is the baseline
            let result = ShapeFinder.Execute(words: WordListExamples.getWordList(), scoreMin: 0, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(result.count,5)
            
            var totalShapes = 0
            for item in result {
                totalShapes += item.count
            }
            
            XCTAssertEqual(totalShapes, 11937)
        }
    }

}

//
//  Test_ShapeModel.swift
//  
//
//  Created by Michael Geurtjens on 5/1/2023.
//

import XCTest
@testable import CrozzlePackage
final class Test_ShapeModel: XCTestCase {


    func testExample() throws {

        let placements:[PlacementModel] = [
            PlacementModel(id:1,x:2,y:3,isHorizontal: true),
            PlacementModel(id:4,x:5,y:6,isHorizontal: false),
            PlacementModel(id:7,x:8,y:9,isHorizontal: false),
            PlacementModel(id:10,x:11,y:12,isHorizontal: true)
        ]
        
        let shape = ShapeModel(s:16, w:5, h:6,p:placements)
        
        let text = shape.ToString()
        print(text)
        
        XCTAssertEqual(text, "")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

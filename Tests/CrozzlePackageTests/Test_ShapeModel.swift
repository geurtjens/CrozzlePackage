//
//  Test_ShapeModel.swift
//  
//
//  Created by Michael Geurtjens on 5/1/2023.
//

import XCTest
@testable import CrozzlePackage
final class Test_ShapeModel: XCTestCase {


    func test_ToJson() throws {
        
        let placements:[PlacementModel] = [
            PlacementModel(id:1,x:2,y:3,isHorizontal: true),
            PlacementModel(id:4,x:5,y:6,isHorizontal: false),
            PlacementModel(id:7,x:8,y:9,isHorizontal: false),
            PlacementModel(id:10,x:11,y:12,isHorizontal: true)
        ]
        
        let shape = ShapeModel(s:16, w:5, h:6,p:placements)
        
        let json = shape.ToJson()
        print(json)
        let expected = "{\"s\":16,\"w\":5,\"h\":6,\"p\":[{\"i\":1,\"x\":2,\"y\":3,\"h\":1},{\"i\":4,\"x\":5,\"y\":6,\"h\":0},{\"i\":7,\"x\":8,\"y\":9,\"h\":0},{\"i\":10,\"x\":11,\"y\":12,\"h\":1}]}"
        XCTAssertEqual(json, expected)
    }
    
    func test_ToCsv() throws {
        
        let placements:[PlacementModel] = [
            PlacementModel(id:1,x:2,y:3,isHorizontal: true),
            PlacementModel(id:4,x:5,y:6,isHorizontal: false),
            PlacementModel(id:7,x:8,y:9,isHorizontal: false),
            PlacementModel(id:10,x:11,y:12,isHorizontal: true)
        ]
        
        let shape = ShapeModel(s:16, w:5, h:6,p:placements)
        
        let csv = shape.ToCsv()
        print(csv)
        XCTAssertEqual(csv, "16,5,6,1,2,3,1,4,5,6,0,7,8,9,0,10,11,12,1")
    }
}

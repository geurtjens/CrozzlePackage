//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 31/12/2022.
//

import XCTest
@testable import CrozzlePackage
class TestingUtilities {
    static func checkAllShapes(shapes: [ShapeModel], wordList: [String]) {
        // This next lot is optional for when its proven to work
        for shape in shapes {
            let text = DrawShape.draw(shape: shape, wordList: wordList)
            
            let isValid = ShapeValidator.Execute(shape: shape, wordList: wordList)
            if isValid == false {
                print(text)
            }
            XCTAssertTrue(isValid)
        }
    }
}

//
//  Test_OpenDonutCalculator.swift
//  
//
//  Created by Michael Geurtjens on 28/12/2022.
//

import XCTest
@testable import CrozzlePackage
final class Test_OpenDonutCalculator: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testSizes() throws {
        let wordList = WordListExamples.getWordList()
        
        let widthMax = UInt8(17)
        let heightMax = UInt8(12)
        let scoreMin = UInt16(0)
        
        let edges = EdgeCalculator.findValidEdges(
            fromWordList: wordList,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        
        
        let o3x3_TopLeft = OpenDonutCalculator.TopLeft(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 3,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("O3x3_TopLeft: \(o3x3_TopLeft.count)")
        XCTAssertEqual(o3x3_TopLeft.count, 153820)
        //XCTAssertEqual(o3x3_TopLeft.count, 164871)
        
        // Top right changes to bottom left so there are no duplicates
        let o3x3_TopRight = OpenDonutCalculator.TopRight(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 3,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("O3x3_TopRight: \(o3x3_TopRight.count)")
        //XCTAssertEqual(o3x3_TopRight.count, 247614)
        XCTAssertEqual(o3x3_TopRight.count, 248083)
        
        let o3x3_BottomLeft = OpenDonutCalculator.BottomLeft(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 3,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("O3x3_BottomLeft: \(o3x3_BottomLeft.count)")
        XCTAssertEqual(o3x3_BottomLeft.count, 0)

        let o3x3_BottomRight = OpenDonutCalculator.BottomRight(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 3,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("O3x3_BottomRight: \(o3x3_BottomRight.count)")
        XCTAssertEqual(o3x3_BottomRight.count, 160_216)

        
        
        let o3x4_TopLeft = OpenDonutCalculator.TopLeft(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 4,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("O3x4_TopLeft: \(o3x4_TopLeft.count)")
        XCTAssertEqual(o3x4_TopLeft.count, 220_148)
        //XCTAssertEqual(o3x4_TopLeft.count, 198276)
        
        // Top right changes to bottom left so there are no duplicates
        let o3x4_TopRight = OpenDonutCalculator.TopRight(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 4,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("O3x4_TopRight: \(o3x4_TopRight.count)")
        XCTAssertEqual(o3x4_TopRight.count, 203487)
        
        let o3x4_BottomLeft = OpenDonutCalculator.BottomLeft(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 4,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("O3x4_BottomLeft: \(o3x4_BottomLeft.count)")
        //XCTAssertEqual(o3x4_BottomLeft.count, 0)
        XCTAssertEqual(o3x4_BottomLeft.count, 186873)
        let o3x4_BottomRight = OpenDonutCalculator.BottomRight(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 4,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("O3x4_BottomRight: \(o3x4_BottomRight.count)")
        XCTAssertEqual(o3x4_BottomRight.count, 206706)
        
        
        
        let o3x5_TopLeft = OpenDonutCalculator.TopLeft(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 5,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("O3x5_TopLeft: \(o3x5_TopLeft.count)")
        XCTAssertEqual(o3x5_TopLeft.count, 163_938)
        //XCTAssertEqual(o3x5_TopLeft.count, 147484)

        let o3x5_TopRight = OpenDonutCalculator.TopRight(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 5,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("O3x5_TopRight: \(o3x5_TopRight.count)")
        XCTAssertEqual(o3x5_TopRight.count, 140_044)
        
        let o3x5_BottomLeft = OpenDonutCalculator.BottomLeft(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 5,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("O3x5_BottomLeft: \(o3x5_BottomLeft.count)")
        XCTAssertEqual(o3x5_BottomLeft.count, 129_100)
        
        let o3x5_BottomRight = OpenDonutCalculator.BottomRight(
            edges: edges,
            words: wordList,
            interlockWidth: 3,
            interlockHeight: 5,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("O3x5_BottomRight: \(o3x5_BottomRight.count)")
        XCTAssertEqual(o3x5_BottomRight.count, 166_525)
        
        
        TestingUtilities.checkAllShapes(shapes: o3x3_TopLeft, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x3_TopRight, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x3_BottomLeft, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x3_BottomRight, wordList: wordList)
        
        TestingUtilities.checkAllShapes(shapes: o3x4_TopLeft, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x4_TopRight, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x4_BottomLeft, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x4_BottomRight, wordList: wordList)
        
        TestingUtilities.checkAllShapes(shapes: o3x5_TopLeft, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x5_TopRight, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x5_BottomLeft, wordList: wordList)
        TestingUtilities.checkAllShapes(shapes: o3x5_BottomRight, wordList: wordList)
        
    }
    
    func testTopLeft() throws {
        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let result = OpenDonutCalculator.TopLeft(edges: edges, words: wordList, interlockWidth: 3, interlockHeight: 4, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let shape = result[0]
        XCTAssertEqual(shape.w, 9)
        XCTAssertEqual(shape.h, 7)
        XCTAssertEqual(shape.s, 144)
        XCTAssertEqual(shape.p.count,4)
        
        let top = shape.p[0]
        XCTAssertEqual(wordList[Int(top.id)], "AZURE")
        XCTAssertEqual(top.id, 1)
        XCTAssertEqual(top.x, 2)
        XCTAssertEqual(top.y, 1)
        XCTAssertTrue(top.isHorizontal)
        
        let bottom = shape.p[1]
        XCTAssertEqual(wordList[Int(bottom.id)], "HYMN")
        XCTAssertEqual(bottom.id, 7)
        XCTAssertEqual(bottom.x, 0)
        XCTAssertEqual(bottom.y, 4)
        XCTAssertTrue(bottom.isHorizontal)
        
        let left = shape.p[2]
        XCTAssertEqual(wordList[Int(left.id)], "TOYS")
        XCTAssertEqual(left.id, 2)
        XCTAssertEqual(left.x, 2)
        XCTAssertEqual(left.y, 1)
        XCTAssertFalse(left.isHorizontal)
        
        let right = shape.p[3]
        XCTAssertEqual(wordList[Int(right.id)], "ZION")
        XCTAssertEqual(right.id, 0)
        XCTAssertEqual(right.x, 4)
        XCTAssertEqual(right.y, 0)
        XCTAssertFalse(right.isHorizontal)
        
        let expectedText = "" +
        "    .    \n" +
        "  .AZURE.\n" +
        "  T I    \n" +
        "  O O    \n" +
        ".HYMN.   \n" +
        "  S .    \n" +
        "  .      "
        
        print(expectedText)
        
        let text = DrawShape.draw(shape: result[0], wordList: wordList)
        XCTAssertEqual(text, expectedText)
        
        if text != expectedText {
            print(text)
            print(DrawShape.flatDraw(text: expectedText))
            
            print(DrawShape.flatDraw(text: text))
            
        }
        //print(text)
        
        
    }
    
    
    func testBottomLeft() throws {
        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let result = OpenDonutCalculator.BottomLeft(edges: edges, words: wordList, interlockWidth: 3, interlockHeight: 4, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let shape = result[0]
        XCTAssertEqual(shape.w, 8)
        XCTAssertEqual(shape.h, 10)
        XCTAssertEqual(shape.s, 60)
        XCTAssertEqual(shape.p.count,4)
        
        let top = shape.p[0]
        XCTAssertEqual(wordList[Int(top.id)], "ZION")
        XCTAssertEqual(top.id, 0)
        XCTAssertEqual(top.x, 0)
        XCTAssertEqual(top.y, 4)
        XCTAssertTrue(top.isHorizontal)
        
        let bottom = shape.p[1]
        XCTAssertEqual(wordList[Int(bottom.id)], "TOYS")
        XCTAssertEqual(bottom.id, 2)
        XCTAssertEqual(bottom.x, 2)
        XCTAssertEqual(bottom.y, 7)
        XCTAssertTrue(bottom.isHorizontal)
        
        let left = shape.p[2]
        XCTAssertEqual(wordList[Int(left.id)], "FAMILY")
        XCTAssertEqual(left.id, 15)
        XCTAssertEqual(left.x, 2)
        XCTAssertEqual(left.y, 0)
        XCTAssertFalse(left.isHorizontal)
        
        let right = shape.p[3]
        XCTAssertEqual(wordList[Int(right.id)], "CINNAMON")
        XCTAssertEqual(right.id, 65)
        XCTAssertEqual(right.x, 4)
        XCTAssertEqual(right.y, 0)
        XCTAssertFalse(right.isHorizontal)
        
        let expectedText = "" +
        "  . .   \n" +
        "  F C   \n" +
        "  A I   \n" +
        "  M N   \n" +
        ".ZION.  \n" +
        "  L A   \n" +
        "  Y M   \n" +
        "  .TOYS.\n" +
        "    N   \n" +
        "    .   "
        //print(expectedText)
        
        let text = DrawShape.draw(shape: result[0], wordList: wordList)
        XCTAssertEqual(text, expectedText)
        //print(text)
    
    }
    
    func testTopRight() throws {
        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        
        let result = OpenDonutCalculator.TopRight(edges: edges, words: wordList, interlockWidth: 3, interlockHeight: 4, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let shape = result[0]
        XCTAssertEqual(shape.w, 13)
        XCTAssertEqual(shape.h, 7)
        XCTAssertEqual(shape.s, 144)
        XCTAssertEqual(shape.p.count,4)
        
        let top = shape.p[0]
        XCTAssertEqual(wordList[Int(top.id)], "GLAZE")
        XCTAssertEqual(top.id, 25)
        XCTAssertEqual(top.x, 0)
        XCTAssertEqual(top.y, 1)
        XCTAssertTrue(top.isHorizontal)
        
        let bottom = shape.p[1]
        XCTAssertEqual(wordList[Int(bottom.id)], "TWENTYFIFTH")
        XCTAssertEqual(bottom.id, 27)
        XCTAssertEqual(bottom.x, 0)
        XCTAssertEqual(bottom.y, 4)
        XCTAssertTrue(bottom.isHorizontal)
        
        let left = shape.p[2]
        XCTAssertEqual(wordList[Int(left.id)], "ZION")
        XCTAssertEqual(left.id, 0)
        XCTAssertEqual(left.x, 4)
        XCTAssertEqual(left.y, 0)
        XCTAssertFalse(left.isHorizontal)
        
        let right = shape.p[3]
        XCTAssertEqual(wordList[Int(right.id)], "TOYS")
        XCTAssertEqual(right.id, 2)
        XCTAssertEqual(right.x, 6)
        XCTAssertEqual(right.y, 1)
        XCTAssertFalse(right.isHorizontal)
        
        let expectedText = "" +
        "    .        \n" +
        ".GLAZE.      \n" +
        "    I T      \n" +
        "    O O      \n" +
        ".TWENTYFIFTH.\n" +
        "    . S      \n" +
        "      .      "
        
        let text = DrawShape.draw(shape: result[0], wordList: wordList)
        XCTAssertEqual(text, expectedText)
        //print(text)
        
//        for shape in result {
//            let text2 = DrawShape.draw(shape:shape, wordList: wordList)
//            print(text2)
//        }
    }
    
    
    func testBottomRight() throws {
        let wordList = WordListExamples.getWordList()
        
        let edges = EdgeCalculator.findValidEdges(fromWordList: wordList, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        
        let result = OpenDonutCalculator.BottomRight(edges: edges, words: wordList, interlockWidth: 3, interlockHeight: 4, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let shape = result[0]
        XCTAssertEqual(shape.w, 10)
        XCTAssertEqual(shape.h, 10)
        XCTAssertEqual(shape.s, 54)
        XCTAssertEqual(shape.p.count,4)
        
        let top = shape.p[0]
        XCTAssertEqual(wordList[Int(top.id)], "FAMILY")
        XCTAssertEqual(top.id, 15)
        XCTAssertEqual(top.x, 2)
        XCTAssertEqual(top.y, 2)
        XCTAssertTrue(top.isHorizontal)
        
        let bottom = shape.p[1]
        XCTAssertEqual(wordList[Int(bottom.id)], "AZURE")
        XCTAssertEqual(bottom.id, 1)
        XCTAssertEqual(bottom.x, 0)
        XCTAssertEqual(bottom.y, 5)
        XCTAssertTrue(bottom.isHorizontal)
        
        let left = shape.p[2]
        XCTAssertEqual(wordList[Int(left.id)], "NAZARETH")
        XCTAssertEqual(left.id, 6)
        XCTAssertEqual(left.x, 4)
        XCTAssertEqual(left.y, 0)
        XCTAssertFalse(left.isHorizontal)
        
        let right = shape.p[3]
        XCTAssertEqual(wordList[Int(right.id)], "ZION")
        XCTAssertEqual(right.id, 0)
        XCTAssertEqual(right.x, 6)
        XCTAssertEqual(right.y, 0)
        XCTAssertFalse(right.isHorizontal)
        
        let expectedText = "" +
        "    . .   \n" +
        "    N Z   \n" +
        "  .FAMILY.\n" +
        "    Z O   \n" +
        "    A N   \n" +
        ".AZURE.   \n" +
        "    E     \n" +
        "    T     \n" +
        "    H     \n" +
        "    .     "
        
        
        
        let text = DrawShape.draw(shape: result[0], wordList: wordList)
        XCTAssertEqual(text, expectedText)
        //print(text)
        
        
//        for shape in result {
//            let text2 = DrawShape.draw(shape:shape, wordList: wordList)
//            print(text2)
//        }
    }
}

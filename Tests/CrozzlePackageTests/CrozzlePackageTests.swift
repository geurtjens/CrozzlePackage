import XCTest
@testable import CrozzlePackage

final class CrozzlePackageTests: XCTestCase {
    
    let wordList = WordListExamples.getWordList()
    
    
    func test_findEdges_CheckFirstItem() throws {
        
        let edges = EdgeCalculator.findEdges(fromWordList: wordList)
        
        // Must be more than 0 items for us to get the first one
        XCTAssertGreaterThan(edges.count, 0)
        
        let edge = edges[0]
        
        XCTAssertEqual(edge.h, 0)
        XCTAssertEqual(edge.v, 1)
//        let horizontalWord = wordList[Int(edge.h)]
//        let verticalWord = wordList[Int(edge.v)]
        
        XCTAssertEqual(edge.hPosFromStart, 0)
        XCTAssertEqual(edge.hPosFromEnd, 3)
        
        XCTAssertEqual(edge.vPosFromStart, 1)
        XCTAssertEqual(edge.vPosFromEnd, 3)
        
        
        // We convert the edges to shapes
        let shapes = EdgeToShapeConverter.toShape(fromEdges: edges, usingWords: wordList, scoreMin: 0, widthMax:17, heightMax:12)
        
        XCTAssertEqual(10757, shapes.count)
        
        let shape = shapes[0]
        
        XCTAssertEqual(shape.s, 84)
        XCTAssertEqual(shape.w, 6)
        XCTAssertEqual(shape.h, 7)
        
        // Edges have only 2 words so all arrays holding words should be a size of 2
        XCTAssertEqual(2, shape.p.count)
        
        let a = shape.p[0]
        let word1 = wordList[Int(a.id)]
        
        XCTAssertEqual(a.id, 0)
        XCTAssertEqual(word1, "ZION")
        XCTAssertEqual(a.x, 0)
        XCTAssertEqual(a.y, 2)
        XCTAssertTrue(a.isHorizontal)
        
        
        let b = shape.p[1]
        let word2 = wordList[Int(b.id)]
        
        XCTAssertEqual(b.id, 1)
        XCTAssertEqual(word2, "AZURE")
        XCTAssertEqual(b.x, 1)
        XCTAssertEqual(b.y, 0)
        XCTAssertFalse(b.isHorizontal)

        let drawn = DrawShape.draw(shape: shape, wordList: wordList)
        print(drawn)
        
        let expected = "" +
           " .    \n" +
           " A    \n" +
           ".ZION.\n" +
           " U    \n" +
           " R    \n" +
           " E    \n" +
           " .    "
        XCTAssertEqual(drawn, expected)
    }
    
    
    
    
    func test_findEdges2_HowManyAnswersComeBack() throws {
        
        let edges = EdgeCalculator.findEdges(fromWordList: wordList)
        
        XCTAssertEqual(edges.count, 10823)
        
        // We convert the edges to shapes
        let shapes = EdgeToShapeConverter.toShape(fromEdges: edges, usingWords: wordList, scoreMin: 0, widthMax:17, heightMax: 12)
        
        XCTAssertEqual(shapes.count, 10757)
    }
    
    
    
    
}

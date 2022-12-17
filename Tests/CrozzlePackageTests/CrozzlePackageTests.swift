import XCTest
@testable import CrozzlePackage

final class CrozzlePackageTests: XCTestCase {
    
    let wordList = WordListExamples.getWordList()
    
    
    func test_findEdges_CheckFirstItem() throws {
        
        let edges = EdgeCalculator.findEdges(fromWordList: wordList)
        
        // Must be more than 0 items for us to get the first one
        XCTAssertGreaterThan(edges.count, 0)
        
        // We convert the edges to shapes
        let shapes = EdgeToShapeConverter.toShape(fromEdges: edges, usingWords: wordList)
        
        XCTAssertEqual(10823, shapes.count)
        
        let shape = shapes[0]
        
        XCTAssertEqual(shape.score, 84)
        XCTAssertEqual(shape.width, 6)
        XCTAssertEqual(shape.height, 7)
        
        // Edges have only 2 words so all arrays holding words should be a size of 2
        XCTAssertEqual(2, shape.placements.count)
        
        let a = shape.placements[0]
        let word1 = wordList[Int(a.id)]
        
        XCTAssertEqual(a.id, 0)
        XCTAssertEqual(word1, "ZION")
        XCTAssertEqual(a.x, 0)
        XCTAssertEqual(a.y, 2)
        XCTAssertTrue(a.isHorizontal)
        
        
        let b = shape.placements[1]
        let word2 = wordList[Int(b.id)]
        
        XCTAssertEqual(b.id, 1)
        XCTAssertEqual(word2, "AZURE")
        XCTAssertEqual(b.x, 1)
        XCTAssertEqual(b.y, 0)
        XCTAssertFalse(b.isHorizontal)

    }
    
    
    
    
    func test_findEdges2_HowManyAnswersComeBack() throws {
        
        let edges = EdgeCalculator.findEdges(fromWordList: wordList)
        
        XCTAssertEqual(edges.count, 10823)
        
        // We convert the edges to shapes
        let shapes = EdgeToShapeConverter.toShape(fromEdges: edges, usingWords: wordList)
        
        XCTAssertEqual(shapes.count, 10823)
    }
    
    
    
    
}

import XCTest
@testable import CrozzlePackage

final class CrozzlePackageTests: XCTestCase {
    
    func test_findEdges_HowManyAnswersComeBack() throws {
        
        let wordList = getWordList()
        
        let edges = EdgeCalculator.findEdges(wordList: wordList)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(10823, edges.count)
        
        let shapes = EdgeCalculator.edgeToShape(wordList: wordList, edges: edges)
        
        XCTAssertEqual(10823, shapes.count)
        
        let shape = shapes[0]
        
        // Edges have only 2 words so all arrays holding words should be a size of 2
        XCTAssertEqual(2, shape.wordOrientationArray.count)
        XCTAssertEqual(2, shape.wordIdArray.count)
        XCTAssertEqual(2, shape.xStartArray.count)
        XCTAssertEqual(2, shape.yStartArray.count)
        
        XCTAssertEqual(0, shape.wordIdArray[0])
        XCTAssertEqual(1, shape.wordIdArray[1])
        
        let word1 = wordList[Int(shape.wordIdArray[0])]
        let word2 = wordList[Int(shape.wordIdArray[1])]
        
        XCTAssertEqual("ZION", word1)
        XCTAssertEqual("AZURE", word2)
        
        XCTAssertEqual(6, shape.width)
        XCTAssertEqual(7, shape.height)
        
        
        XCTAssertTrue(shape.wordOrientationArray[0])
        XCTAssertFalse(shape.wordOrientationArray[1])
        
        XCTAssertEqual(0, shape.xStartArray[0])
        XCTAssertEqual(2, shape.yStartArray[0])
        
        XCTAssertEqual(1, shape.xStartArray[1])
        XCTAssertEqual(0, shape.yStartArray[1])
    }
    
    func getWordList() -> [String] {
        return [            "ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE",
            
            "GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"
        ]
    }
    
    
    func test_findEdges2_HowManyAnswersComeBack() throws {

        let wordList = getWordList()
        
        let result = EdgeCalculator.findEdges(wordList: wordList)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(10823, result.count)
    }
}

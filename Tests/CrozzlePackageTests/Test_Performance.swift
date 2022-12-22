//
//  PerformanceTests.swift
//  
//
//  Created by Michael Geurtjens on 21/12/2022.
//

import XCTest
@testable import CrozzlePackage
final class Test_Performance: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let wordCount = wordModel.wordCount
        
        let cluster = C2x3_RLR_MO.Execute(W: wordModel, wordCount: wordCount)
        
        let C2x3_RLR_MO = ToShape.from(cluster: cluster, wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        print("C2x3_LRL_MO = \(C2x3_RLR_MO.count)")
        let text0 = DrawShape.draw(shape: C2x3_RLR_MO[0], wordList: wordList)
        
        let expectedText0 = "" +
           "     .       \n" +
           "     S       \n" +
           "     T       \n" +
           "    .O       \n" +
           "   .ICECREAM.\n" +
           ".DRINK.      \n" +
           "   .NICHOLAS.\n" +
           "    .N       \n" +
           "     G       \n" +
           "     .       "
    
        XCTAssertEqual(text0, expectedText0)
        
        let text1 = DrawShape.draw(shape: C2x3_RLR_MO[1], wordList: wordList)
        print(text1)
        
        let expectedText1 = "" +
       "     .         \n" +
       "     C         \n" +
       "     H         \n" +
       "    .I         \n" +
       "   .ICECREAM.  \n" +
       ".DRINK.        \n" +
       "   .NEIGHBOURS.\n" +
       "    .N         \n" +
       "     .         "
        print("")
        print(text1)
        print("")
        print(expectedText1)
        XCTAssertEqual(text1, expectedText1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        	    
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let wordCount = wordModel.wordCount
        let C1x1 = EdgeCalculator.findEdges(fromWordList: wordList)
        print("C1x1 = \(C1x1.count)")
        
        let C2x2_RL_DU = ToShape.from(cluster:C2x2_RL_DU.Execute(W: wordModel), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x2_RL_DU = \(C2x2_RL_DU.count)")
        
        let C2x2_RL_UD = ToShape.from(cluster:C2x2_RL_UD.Execute(W: wordModel), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x2_RL_UD = \(C2x2_RL_UD.count)")
        
        let C2x2_LR_UD = ToShape.from(cluster:C2x2_LR_UD.Execute(W: wordModel), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x2_LR_UD = \(C2x2_LR_UD.count)")
        
        let C2x3_RLR_DU = ToShape.from(cluster:C2x3_RLR_DU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x3_RLR_DU = \(C2x3_RLR_DU.count)")
        
        let C2x3_RLR_UD = ToShape.from(cluster:C2x3_RLR_UD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x3_RLR_UD = \(C2x3_RLR_UD.count)")
        
        let C2x3_LRL_DU = ToShape.from(cluster:C2x3_LRL_DU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x3_LRL_DU = \(C2x3_LRL_DU.count)")
        
        let C2x3_LRL_UD = ToShape.from(cluster:C2x3_LRL_UD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x3_LRL_UD = \(C2x3_LRL_UD.count)")
        
        let C2x4_RLRL_DU = ToShape.from(cluster:C2x4_RLRL_DU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x4_RLRL_DU = \(C2x4_RLRL_DU.count)")
        
        let C2x4_RLRL_UD = ToShape.from(cluster:C2x4_RLRL_UD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x4_RLRL_UD = \(C2x4_RLRL_UD.count)")
        
        let C2x4_LRLR_DU = ToShape.from(cluster:C2x4_LRLR_DU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x4_LRLR_DU = \(C2x4_LRLR_DU.count)")
        
        let C2x4_LRLR_UD = ToShape.from(cluster:C2x4_LRLR_UD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x4_LRLR_UD = \(C2x4_LRLR_UD.count)")
        
        let C2x5_RLRLR_DU = ToShape.from(cluster:C2x5_RLRLR_DU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x5_RLRLR_DU = \(C2x5_RLRLR_DU.count)")
        
        let C2x5_RLRLR_UD = ToShape.from(cluster:C2x5_RLRLR_UD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x5_RLRLR_UD = \(C2x5_RLRLR_UD.count)")
        
        let C2x5_LRLRL_DU = ToShape.from(cluster:C2x5_LRLRL_DU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x5_LRLRL_DU = \(C2x5_LRLRL_DU.count)")
        
        let C2x5_LRLRL_UD = ToShape.from(cluster:C2x5_LRLRL_UD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x5_LRLRL_UD = \(C2x5_LRLRL_UD.count)")
        
        let C2x6_RLRLRL_DU = ToShape.from(cluster:C2x6_RLRLRL_DU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x6_RLRLRL_DU = \(C2x6_RLRLRL_DU.count)")
        
        let C2x6_RLRLRL_UD = ToShape.from(cluster:C2x6_RLRLRL_UD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x6_RLRLRL_UD = \(C2x6_RLRLRL_UD.count)")
        
        let C2x6_LRLRLR_DU = ToShape.from(cluster:C2x6_LRLRLR_DU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x6_LRLRLR_DU = \(C2x6_LRLRLR_DU.count)")
        
        let C2x6_LRLRLR_UD = ToShape.from(cluster:C2x6_LRLRLR_UD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x6_LRLRLR_UD = \(C2x6_LRLRLR_UD.count)")
        
        
        let C3x3_RLR_DUD = ToShape.from(cluster:C3x3_RLR_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x3_RLR_DUD = \(C3x3_RLR_DUD.count)")
        
        let C3x3_RLR_UDU = ToShape.from(cluster:C3x3_RLR_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x3_RLR_UDU = \(C3x3_RLR_UDU.count)")
        
        let C3x3_LRL_UDU = ToShape.from(cluster:C3x3_LRL_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x3_LRL_UDU = \(C3x3_LRL_UDU.count)")
        
        let C3x4_RLRL_DUD = ToShape.from(cluster:C3x4_RLRL_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x4_LRLR_DUD = \(C3x4_RLRL_DUD.count)")
        
        let C3x4_RLRL_UDU = ToShape.from(cluster:C3x4_RLRL_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x4_LRLR_UDU = \(C3x4_RLRL_UDU.count)")
        
        let C3x4_LRLR_DUD = ToShape.from(cluster:C3x4_LRLR_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x4_LRLR_DUD = \(C3x4_LRLR_DUD.count)")
        
        let C3x4_LRLR_UDU = ToShape.from(cluster:C3x4_LRLR_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x4_LRLR_UDU = \(C3x4_LRLR_UDU.count)")
        
        
        let C3x5_RLRLR_DUD = ToShape.from(cluster:C3x5_RLRLR_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x5_RLRLR_DUD = \(C3x5_RLRLR_DUD.count)")
        
        let C3x5_RLRLR_UDU = ToShape.from(cluster:C3x5_RLRLR_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x5_RLRLR_UDU = \(C3x5_RLRLR_UDU.count)")
        
        let C3x5_LRLRL_DUD = ToShape.from(cluster:C3x5_LRLRL_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x5_LRLRL_DUD = \(C3x5_LRLRL_DUD.count)")
        
        let C3x5_LRLRL_UDU = ToShape.from(cluster:C3x5_LRLRL_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x5_LRLRL_UDU = \(C3x5_LRLRL_UDU.count)")
        
        
        
        print("NOW THE SPECIAL ONES")
        
        
        let C3x4_LRML_DUD = ToShape.from(cluster:C3x4_LRML_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C3x4_LRML_DUD = \(C3x4_LRML_DUD.count)")
        
        
        
        
        
        
        
        
        
        let C2x3_LRL_MO = ToShape.from(cluster:C2x3_LRL_MO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x3_LRL_MO = \(C2x3_LRL_MO.count)")
        
        let C2x3_LRL_OM = ToShape.from(cluster:C2x3_LRL_OM.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x3_LRL_OM = \(C2x3_LRL_OM.count)")
        
        
        
        
        
        let C2x3_RLR_MO = ToShape.from(cluster:C2x3_RLR_MO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x3_RLR_MO = \(C2x3_RLR_MO.count)")
        
        // The MO and OM processes are not working yet
        //print(DrawShape.draw(shape: C2x3_RLR_MO[0], wordList: wordList))
        //print(DrawShape.draw(shape: C2x3_RLR_MO[1], wordList: wordList))
       // let C2x3_RLR_OM = ToShape.from(cluster:C2x3_RLR_OM.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        //print("C2x3_RLR_OM = \(C2x3_RLR_OM.count)")
    }

}

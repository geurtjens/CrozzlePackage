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

    func testASDF() throws {
        let wordList = ["BEIM", "ABCD", "CFJ", "EFG",  "ZDGK", "HIJKL"]
        
        let wordModel = WordModelSOA(words: wordList)
        let wordCount = wordModel.wordCount
        
        let C3x3_LMO_DMU = ToShape.from(cluster: C3x3_LMO_DMU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(C3x3_LMO_DMU.count,1)
        let draw = DrawShape.draw(shape: C3x3_LMO_DMU[0], wordList: wordList)
        print(draw)
        
    }
    func testExample() throws {
        
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let wordCount = wordModel.wordCount
        
        let C3x3_LMO_DMU = ToShape.from(cluster: C3x3_LMO_DMU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMO_DUD = ToShape.from(cluster: C3x3_LMO_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMO_MOM = ToShape.from(cluster: C3x3_LMO_MOM.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMO_OMD = ToShape.from(cluster: C3x3_LMO_OMD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMO_OMO = ToShape.from(cluster: C3x3_LMO_OMO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMO_OMU = ToShape.from(cluster: C3x3_LMO_OMU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMO_UDU = ToShape.from(cluster: C3x3_LMO_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMO_UMD = ToShape.from(cluster: C3x3_LMO_UMD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMO_UMO = ToShape.from(cluster: C3x3_LMO_UMO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        
        let C2x3_LRL_MO = ToShape.from(cluster: C2x3_LRL_MO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C2x3_LRL_OM = ToShape.from(cluster: C2x3_LRL_OM.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
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
    
    func testLMR() throws {
        
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let wordCount = wordModel.wordCount
        
        let C3x3_LMR_DMU = ToShape.from(cluster: C3x3_LMR_DMU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMR_DUD = ToShape.from(cluster: C3x3_LMR_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMR_MOM = ToShape.from(cluster: C3x3_LMR_MOM.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMR_OMD = ToShape.from(cluster: C3x3_LMR_OMD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMR_OMO = ToShape.from(cluster: C3x3_LMR_OMO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMR_OMU = ToShape.from(cluster: C3x3_LMR_OMU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMR_UDU = ToShape.from(cluster: C3x3_LMR_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMR_UMD = ToShape.from(cluster: C3x3_LMR_UMD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_LMR_UMO = ToShape.from(cluster: C3x3_LMR_UMO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let count = C3x3_LMR_DMU + C3x3_LMR_DUD + C3x3_LMR_MOM + C3x3_LMR_OMD + C3x3_LMR_OMO + C3x3_LMR_OMU + C3x3_LMR_UDU + C3x3_LMR_UMD + C3x3_LMR_UMO
        
        XCTAssertEqual(count.count,0)
    }

    func test_C3x3_MOM_DMO() throws {
        let wordList = ["BEN","OKAYN","PAT","BKPL","EAA","ANYTE"]
        let wordModel = WordModelSOA(words: wordList)
        let wordCount = wordModel.wordCount
        
        
        let C3x3_MOM_DMO = ToShape.from(cluster: C3x3_MOM_DMO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let draw = DrawShape.draw(shape: C3x3_MOM_DMO[0], wordList: wordList)
        print(draw)
    }
    
    func test_C2x3_LRL_OM() {
        
        let expected = "" +
         "  .   \n" +
         "  Y.  \n" +
         ".ABC. \n" +
         " .DEF.\n" +
         ".GHI. \n" +
         "  Z.  \n" +
         "  .   "
        
        let wordList = ["ABC","DEF","GHI","YBDHZ","CEI"]
        let wordModel = WordModelSOA(words: wordList)
        let result = ToShape.from(cluster: C2x3_LRL_OM.Execute(W: wordModel, wordCount: wordList.count),
                                          wordList: wordModel, scoreMin:0, widthMax:17, heightMax:12)
        
        XCTAssertEqual(result.count,1)
        let printed = DrawShape.draw(shape: result[0], wordList: wordList)
        print(printed)
        XCTAssertEqual(printed,expected)
    }
    
    func test_C2x3_LRL_MO() throws {
        /*Cluster2x3
         LRL_DU: 64
         LRL_MO:
         LRL_OM:
         LRL_UD: 152
         RLR_DU: 56
         RLR_MO: 2
         RLR_OM: 3
         RLR_UD: 20
         */
        
        // So we are missing the LRL_MO and LRL_OM in this wordlist so lets make them up
        
        let expected = "" +
         "   .  \n" +
         "  .Y  \n" +
         ".ABC. \n" +
         " .DEF.\n" +
         ".GHI. \n" +
         "  .Z  \n" +
         "   .  "
        
        let wordList = ["ABC","DEF","GHI","BDH","YCEIZ"]
        let wordModel = WordModelSOA(words: wordList)
        let result = ToShape.from(cluster: C2x3_LRL_MO.Execute(W: wordModel, wordCount: wordList.count),
                                          wordList:wordModel,scoreMin:0, widthMax:17, heightMax:12)
        
        XCTAssertEqual(result.count,1)
        let printed = DrawShape.draw(shape: result[0], wordList: wordList)
        print(printed)
        XCTAssertEqual(printed,expected)
    }
    
    func testMOM() throws {
        
        let wordList = ["BEN","OKAYN","PAT","BKPL","EAA","ANYTE"] // WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let wordCount = wordModel.wordCount
        
        
        let C3x3_MOM_DMO = ToShape.from(cluster: C3x3_MOM_DMO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_DMU = ToShape.from(cluster: C3x3_MOM_DMU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_DUD = ToShape.from(cluster: C3x3_MOM_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_MOM = ToShape.from(cluster: C3x3_MOM_MOM.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_OMD = ToShape.from(cluster: C3x3_MOM_OMD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_OMO = ToShape.from(cluster: C3x3_MOM_OMO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_OMU = ToShape.from(cluster: C3x3_MOM_OMU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_UDU = ToShape.from(cluster: C3x3_MOM_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_UMD = ToShape.from(cluster: C3x3_MOM_UMD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let C3x3_MOM_UMO = ToShape.from(cluster: C3x3_MOM_UMO.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        let count = C3x3_MOM_DMO + C3x3_MOM_DMU + C3x3_MOM_DUD + C3x3_MOM_MOM + C3x3_MOM_OMD + C3x3_MOM_OMO + C3x3_MOM_OMU + C3x3_MOM_UDU + C3x3_MOM_UMD + C3x3_MOM_UMO
        
        XCTAssertEqual(count.count,0)
    }
    
    func test2x2() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C2x2.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 799)
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func test2x3() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C2x3.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 297)
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func test2x4() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C2x4.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 61)
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func test2x5() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C2x5.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 12)
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func test2x6() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C2x6.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 0)
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func test3x3() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C3x3.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 9)
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func test3x4() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C3x4.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 2)
        
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func test3x5() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C3x5.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 0)
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func test3x6() throws {
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        let result = C3x6.Execute(w: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(result.count, 0)
        for shape in result {
            print(DrawShape.draw(shape: shape, wordList: wordList))
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        	    
        let wordList = WordListExamples.getWordList()
        let wordModel = WordModelSOA(words: wordList)
        
        let wordCount = wordModel.wordCount
        let C1x1 = EdgeCalculator.findEdges(fromWordList: wordList)
        print("C1x1 = \(C1x1.count)")
        
        let C2x2_RL_DU = ToShape.from(cluster:C2x2_RL_DU.Execute(W: wordModel, wordCount: wordList.count), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x2_RL_DU = \(C2x2_RL_DU.count)")
        
        let C2x2_RL_UD = ToShape.from(cluster:C2x2_RL_UD.Execute(W: wordModel, wordCount: wordList.count), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
        print("C2x2_RL_UD = \(C2x2_RL_UD.count)")
        
        let C2x2_LR_UD = ToShape.from(cluster:C2x2_LR_UD.Execute(W: wordModel, wordCount: wordList.count), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
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
        
        
//        let C3x5_RLRLR_DUD = ToShape.from(cluster:C3x5_RLRLR_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
//        print("C3x5_RLRLR_DUD = \(C3x5_RLRLR_DUD.count)")
//
//        let C3x5_RLRLR_UDU = ToShape.from(cluster:C3x5_RLRLR_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
//        print("C3x5_RLRLR_UDU = \(C3x5_RLRLR_UDU.count)")
//
//        let C3x5_LRLRL_DUD = ToShape.from(cluster:C3x5_LRLRL_DUD.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
//        print("C3x5_LRLRL_DUD = \(C3x5_LRLRL_DUD.count)")
//
//        let C3x5_LRLRL_UDU = ToShape.from(cluster:C3x5_LRLRL_UDU.Execute(W: wordModel, wordCount: wordCount), wordList: wordModel, scoreMin: 0, widthMax: 17, heightMax: 12)
//        print("C3x5_LRLRL_UDU = \(C3x5_LRLRL_UDU.count)")
//
        
        
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

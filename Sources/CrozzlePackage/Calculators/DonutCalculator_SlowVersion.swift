//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 25/12/2022.
//

import Foundation
public class DonutCalculator_SlowVersion {
    public static func ExecuteEdges(edges: [EdgeModel], wordList:[String], interlockWidth: Int, interlockHeight:Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> DonutModel {

          
        let topLeftList = edges.filter() { $0.hPosFromEnd >= interlockWidth - 1 && $0.vPosFromEnd >= interlockHeight - 1}
        
        let bottomRightList = edges.filter() { $0.hPosFromStart >= interlockWidth - 1 && $0.vPosFromStart >= interlockHeight - 1}
        
        var wordId: [UInt8] = []
        var startPos: [UInt8] = []
        let stride = 4
        var shapeCount = 0;
        var index = 0
        for cycle in 0...1 {
            
            if cycle == 1 {
                wordId = Array(repeating: 0, count: shapeCount * stride)
                startPos = Array(repeating: 0, count: shapeCount * stride)
            }
            

            for topLeftPos in 0..<topLeftList.count {
                for bottomRightPos in 0..<bottomRightList.count {
                    
                    let topLeftEdge = topLeftList[topLeftPos];
                    let bottomRightEdge = bottomRightList[bottomRightPos];
                    if (topLeftEdge.h != bottomRightEdge.h &&
                        topLeftEdge.h != bottomRightEdge.v &&
                        topLeftEdge.v != bottomRightEdge.h &&
                        topLeftEdge.v != bottomRightEdge.v) {
                        
                        let topWord = wordList[Int(topLeftEdge.h)]
                        let bottomWord = wordList[Int(bottomRightEdge.h)]
                        let leftWord = wordList[Int(topLeftEdge.v)]
                        let rightWord = wordList[Int(bottomRightEdge.v)]
                        
                        // Have to fix all this as its not correct when I debug.
                        let topLeftHPos = Int(Int(topLeftEdge.hPosFromStart) + interlockWidth - 1)
                        let topLeftH = topWord[topLeftHPos];
                        
                        let topLeftVPos = Int(topLeftEdge.vPosFromStart) + interlockHeight - 1
                        let topLeftV = leftWord[topLeftVPos];
                        
                        let bottomRightHPos = Int(bottomRightEdge.hPosFromStart) - interlockWidth + 1
                        let bottomRightH = bottomWord[bottomRightHPos];
                        
                        let bottomRightVPos = Int(bottomRightEdge.vPosFromStart) - interlockHeight + 1
                        let bottomRightV = rightWord[bottomRightVPos];
                        // We want to make sure that the top left edge can connect to the bottom right edge
                        if (topLeftH == bottomRightV && topLeftV == bottomRightH)
                        {
                            if cycle == 0 {
                                shapeCount += 1
                            }
                            else {
                                wordId[index + 0] = topLeftEdge.h
                                wordId[index + 1] = bottomRightEdge.h
                                wordId[index + 2] = topLeftEdge.v
                                wordId[index + 3] = bottomRightEdge.v
                                
                                // Check that this is accurate as I presume it isnt
                                startPos[index + 0] = topLeftEdge.hPosFromStart // this is the interlocking letter from top word
                                startPos[index + 1] = UInt8(bottomRightHPos) // the interlocking letter from the bottom
                                startPos[index + 2] = topLeftEdge.vPosFromStart // this is the interlocking letter from left
                                startPos[index + 3] = UInt8(bottomRightVPos) // this is the interlocking letter from right

//                                print(topWord[Int(startPos[index + 0])])
//                                print(bottomWord[Int(startPos[index + 1])])
//                                print(leftWord[Int(startPos[index + 2])])
//                                print(rightWord[Int(startPos[index + 3])])
                                
                                index += stride
                            }
                        }
                    }
                }
            }
        }
        
        if interlockWidth == interlockHeight {
        // We must remove duplicates
            
            let duplicates = RemoveDuplicates.FindDuplicates2x2(size: shapeCount, stride: 4, wordId: wordId)
            
            let uniqueShapeCount = duplicates.filter { $0 == false }.count
            
            (wordId, startPos) = RemoveDuplicates.FilterUnique2(duplicates: duplicates, wordId: wordId, startPos: startPos, existingSize: shapeCount, stride: 4, uniqueSize: uniqueShapeCount)
            
            shapeCount = uniqueShapeCount
        }

        let donutModel = DonutModel(shapeCount: shapeCount, interlockWidth: interlockWidth, interlockHeight: interlockHeight, wordId: wordId, startPos: startPos)
        
        // Lastly we need to change to shapes so we can filter out those that are larger than 17x12
        
        return donutModel
        
    }
}
            
            
            
            
            //        if interlockWidth == interlockHeight {
            //            print("Removing duplicates for D" + String(interlockWidth) + "x" + String(interlockHeight) + " from " + String(result.count) + " rows.")
            //            let withoutDuplicates = RemoveDuplicates(shapes:result)
            //
            //            // Sort first by score and then by potential
            //            let sorted = withoutDuplicates.sorted() {
            //                if $0.score == $1.score {
            //                    return $0.potential > $1.potential
            //                }
            //                return $0.score > $1.score
            //            }
            //
            //            var header: [ClusterModel] = []
            //            header.append(ClusterModel(category: "Donut", type: "", items: sorted, interlockWidth:interlockWidth, interlockHeight:interlockHeight, minScore: minScore,
            //                maxWidth:maxWidth,
            //                maxHeight:maxHeight,
            //                id:"D" + String(interlockHeight) + "x" + String(interlockWidth)))
            //
            //            return header;
            //
            //        }
            //        else {
            // remove duplicates
            //let noduplicates = Array(Set(result))
            
            // Sort first by score and then by potential
//            let sorted = result.sorted() {
//                $0.score > $1.score
//            }
//
//            var header: [ClusterModel] = []
//            header.append(ClusterModel(
//                category: "Donut",
//                type: "",
//                items: sorted,
//                interlockWidth:interlockWidth,
//                interlockHeight:interlockHeight,
//                minScore: minScore,
//                maxWidth:maxWidth,
//                maxHeight:maxHeight,
//                id:"D" + String(interlockHeight) + "x" + String(interlockWidth),
//                wordCount:4))
//
//            return header;
//            //        }
//        }
//    }

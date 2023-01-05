//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 30/12/2022.
//

import Foundation
public class DonutCalculator {
    public static func ExecuteEdges(edges: [EdgeModel], wordList:[String], interlockWidth: Int, interlockHeight:Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let wordCount = wordList.count
        var duplicates: Set = [0]
        var result: [ShapeModel] = []
        
        let topLeftList = edges.filter() { $0.hPosFromEnd >= interlockWidth - 1 && $0.vPosFromEnd >= interlockHeight - 1}

        let bottomRightList = edges.filter() { $0.hPosFromStart >= interlockWidth - 1 && $0.vPosFromStart >= interlockHeight - 1}

        for topLeftPos in 0..<topLeftList.count {
            for bottomRightPos in 0..<bottomRightList.count {
                
                let topLeftEdge = topLeftList[topLeftPos];
                let bottomRightEdge = bottomRightList[bottomRightPos];
                if (topLeftEdge.h != bottomRightEdge.h &&
                    topLeftEdge.h != bottomRightEdge.v &&
                    topLeftEdge.v != bottomRightEdge.h &&
                    topLeftEdge.v != bottomRightEdge.v) {
                    
                    let topId = Int(topLeftEdge.h)
                    let bottomId = Int(bottomRightEdge.h)
                    let leftId = Int(topLeftEdge.v)
                    let rightId = Int(bottomRightEdge.v)
                    
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
                    
                    
                    let topPos = topLeftEdge.hPosFromStart
                    let bottomPos = bottomRightEdge.hPosFromStart - UInt8(interlockWidth - 1)
                    let leftPos = topLeftEdge.vPosFromStart
                    let rightPos = bottomRightEdge.vPosFromStart - UInt8(interlockHeight - 1)
                    
                    // We want to make sure that the top left edge can connect to the bottom right edge
                    if (topLeftH == bottomRightV && topLeftV == bottomRightH)
                    {
                        
                        let pattern = String(
                            [
                                topWord[Int(topPos)],
                                topWord[Int(topPos) + interlockWidth - 1],
                                bottomWord[Int(bottomPos)],
                                bottomWord[Int(bottomPos) + interlockWidth - 1] ])
                        
                        let score = UInt16(ScoreCalculator.score(word: pattern)) + 40
                        
                        if score >= scoreMin {
                            
                            let maxHorizontalStart = max(topPos,bottomPos)
                            let lengthTop = UInt8(topWord.count) - topPos
                            let lengthBottom = UInt8(bottomWord.count) - bottomPos
                            
                            let width = maxHorizontalStart + max(lengthTop, lengthBottom) + 2
                            
                            let maxVerticalStart = max(leftPos, rightPos)
                            let heightLeft = UInt8(leftWord.count) - leftPos
                            let heightRight = UInt8(rightWord.count) - rightPos
                            
                            let height = maxVerticalStart + max(heightLeft,heightRight) + 2
                            
                            
                            
                            
                            if ((width <= widthMax && height <= heightMax) || (height <= widthMax && width <= heightMax)) {
                                
                                var isDuplicate = false
                                if interlockWidth == interlockHeight {
                                    
                                    var current = topId
                                    current += bottomId * wordCount
                                    current += leftId * wordCount * wordCount
                                    current += rightId * wordCount * wordCount * wordCount
                                    
                                    var duplicate = leftId
                                    duplicate += rightId * wordCount
                                    duplicate += topId * wordCount * wordCount
                                    duplicate += bottomId * wordCount * wordCount * wordCount
                                    
                                    //duplicates.insert(duplicate)
                                    
                                    if duplicates.contains(duplicate) {
                                        isDuplicate = true
                                    }
                                    else {
                                        duplicates.insert(current)
                                    }
                                }
                                //print(duplicates.count)
                                if isDuplicate == false {
                                    
                                    let shape = ShapeModel(
                                        s: score,
                                        w: width,
                                        h: height,
                                        p: [
                                            PlacementModel(
                                                id: UInt8(topId),
                                                x: maxHorizontalStart - topPos, // made it bottomPos
                                                y: maxVerticalStart + 1,
                                                isHorizontal: true),
                                            PlacementModel(
                                                id: UInt8(bottomId),
                                                x: maxHorizontalStart - bottomPos,
                                                y: maxVerticalStart + UInt8(interlockHeight),
                                                isHorizontal: true),
                                            PlacementModel(
                                                id: UInt8(leftId),
                                                x: maxHorizontalStart + 1,
                                                y: maxVerticalStart - leftPos,
                                                isHorizontal: false),
                                            PlacementModel(
                                                id: UInt8(rightId),
                                                x: maxHorizontalStart + UInt8(interlockWidth),
                                                y: maxVerticalStart - rightPos,
                                                isHorizontal: false)
                                        ])
                                    
//                                    let text = DrawShape.draw(shape: shape, wordList: wordList)
//
//                                    let isValid = ShapeValidator.Execute(shape: shape, wordList: wordList)
//                                    if isValid == false {
//                                        print(text)
//                                        print("Fix it")
//                                    }
                                    result.append(shape)
                                }
                                
                            }
                        }
                    }
                }
            }
            
        }
        return result
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

//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/12/2022.
//

import Foundation

public struct OpenDonutCalculator {
    
    public static func Execute(edges: [EdgeModel], words: [String], interlockWidth: Int, interlockHeight: Int, scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel] {
        
        let topLeftShapes = TopLeft(edges: edges, words: words, interlockWidth: interlockWidth, interlockHeight: interlockHeight, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let topRightShapes = TopRight(edges: edges, words: words, interlockWidth: interlockWidth, interlockHeight: interlockHeight, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        // bottom left is a duplicate of top right but only if we have a 3x3 etc were the horizontal and vertical are the same
        let bottomLeftShapes = BottomLeft(edges: edges, words: words, interlockWidth: interlockWidth, interlockHeight: interlockHeight, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let bottomRightShapes = BottomRight(edges: edges, words: words, interlockWidth: interlockWidth, interlockHeight: interlockHeight, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let shapes = bottomLeftShapes + bottomRightShapes + topLeftShapes + topRightShapes
        
        return shapes.sorted { $0.score > $1.score }
        
    }
    
    
    public static func BottomRight(edges:[EdgeModel], words: [String], interlockWidth:Int, interlockHeight:Int,  scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
        let wordCount = words.count
        var duplicates: Set = [0]
        
        let topRightEdges = edges.filter {$0.vPosFromEnd == interlockHeight - 2 && $0.hPosFromStart >= interlockWidth - 1}
        
        let bottomLeftEdges = edges.filter {$0.hPosFromEnd == interlockWidth - 2 && $0.vPosFromStart >= interlockHeight - 1}
        
        for topRightEdge in topRightEdges {
            for bottomLeftEdge in bottomLeftEdges {
                
                let topId = Int(topRightEdge.h)
                let bottomId = Int(bottomLeftEdge.h)
                let leftId = Int(bottomLeftEdge.v)
                let rightId = Int(topRightEdge.v)
                
                let topWord = words[topId]
                let bottomWord = words[bottomId]
                let leftWord = words[leftId]
                let rightWord = words[rightId]
                
                let topRightPos = Int(topRightEdge.hPosFromStart) - interlockWidth + 1
                let bottomLeftPos = Int(bottomLeftEdge.vPosFromStart) - interlockHeight + 1
                
                if topRightPos >= topWord.count {
                    print("topRightPos out of range")
                }
                if  bottomLeftPos >= leftWord.count {
                    print("bottomLeftPos out of range")
                }
                
                let topRightLetter = topWord[topRightPos]
                let bottomLeftLetter = leftWord[bottomLeftPos]
                
                if topRightLetter == bottomLeftLetter {
                    
                    if topRightEdge.h != bottomLeftEdge.h && topRightEdge.h != bottomLeftEdge.v  &&
                        topRightEdge.v != bottomLeftEdge.h && topRightEdge.v != bottomLeftEdge.v {
                        
                        // The interlocking position for each letter
                        let topPos = topRightEdge.hPosFromStart - (UInt8(interlockWidth) - 1)
                        let bottomPos = bottomLeftEdge.hPosFromStart
                        let leftPos = bottomLeftEdge.vPosFromStart - UInt8(interlockHeight - 1)
                        let rightPos = topRightEdge.vPosFromStart
                        
                        let pattern = String([topWord[Int(topPos)], rightWord[Int(rightPos)], bottomWord[Int(bottomPos)] ])
                        
                        let score = UInt16(ScoreCalculator.score(word: pattern)) + 40
                        
                        if score >= scoreMin {
                            
                            let xMax = max(topPos, bottomPos)
                            let width = xMax + UInt8(max(topWord.count - Int(topPos), bottomWord.count - Int(bottomPos) )) + 2
                            
                            let yMax = max(leftPos, rightPos)
                            let height = yMax + UInt8(leftWord.count - Int(leftPos)) + 2
                            
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
                                        score: score,
                                        width: width,
                                        height: height,
                                        placements: [
                                            PlacementModel(
                                                id: topRightEdge.h,
                                                x: xMax - topPos,
                                                y: yMax + 1,
                                                isHorizontal: true),
                                            PlacementModel(
                                                id: bottomLeftEdge.h,
                                                x: xMax - bottomPos,
                                                y: yMax + UInt8(interlockHeight),
                                                isHorizontal: true),
                                            PlacementModel(
                                                id: bottomLeftEdge.v,
                                                x: xMax + 1,
                                                y: yMax - leftPos,
                                                isHorizontal: false),
                                            PlacementModel(
                                                id: topRightEdge.v,
                                                x: xMax + UInt8(interlockWidth) - 1 + 1,
                                                y: yMax - rightPos,
                                                isHorizontal: false)
                                        ])
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
    
    
    public static func TopLeft(edges: [EdgeModel], words: [String], interlockWidth: Int, interlockHeight: Int, scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
        let wordCount = words.count
        var duplicates: Set = [0]
        
        let topRightEdges = edges.filter {$0.hPosFromStart == interlockWidth - 2 && $0.vPosFromEnd >= interlockHeight - 1}
        
        let bottomLeftEdges = edges.filter {$0.vPosFromStart == interlockHeight - 2 && $0.hPosFromEnd >= interlockWidth - 1}
        
        for topRightEdge in topRightEdges {
            for bottomLeftEdge in bottomLeftEdges {
                
                let topId = Int(topRightEdge.h)
                let bottomId = Int(bottomLeftEdge.h)
                let leftId = Int(bottomLeftEdge.v)
                let rightId = Int(topRightEdge.v)
                
                let topWord = words[topId]
                let bottomWord = words[bottomId]
                let leftWord = words[leftId]
                let rightWord = words[rightId]
                
                let topRightPos = Int(topRightEdge.vPosFromStart) + interlockHeight - 1
                let bottomLeftPos = Int(bottomLeftEdge.hPosFromStart) + interlockWidth - 1
                
                if topRightPos >= rightWord.count ||
                    bottomLeftPos >= bottomWord.count {
                    print("out of index")
                }
                
                let topRightLetter = rightWord[topRightPos]
                let bottomLeftLetter = bottomWord[bottomLeftPos]
                
                if topRightLetter == bottomLeftLetter {
                    
                    if topRightEdge.h != bottomLeftEdge.h && topRightEdge.h != bottomLeftEdge.v  &&
                        topRightEdge.v != bottomLeftEdge.h && topRightEdge.v != bottomLeftEdge.v {
                        
                        let topPos = topRightEdge.hPosFromStart
                        //let leftPos = bottomLeftEdge.vPosFromStart
                        let bottomPos = bottomLeftEdge.hPosFromStart
                        let rightPos = topRightEdge.vPosFromStart
                        
                        let pattern = String([
                            topWord[Int(topPos)],
                            bottomWord[Int(bottomPos)],
                            bottomWord[Int(bottomPos) + interlockWidth - 1] ])
                        
                        let score = UInt16(ScoreCalculator.score(word: pattern)) + 40
                        
                        if score >= scoreMin {
                            
                            let topWidth = UInt8(topWord.count) + 1
                            let bottomWidth = UInt8(bottomWord.count) - bottomPos
                            let width = bottomPos +  max(topWidth, bottomWidth) + 2
                            
                            let height = rightPos + 1 + max(UInt8(leftWord.count + 2), UInt8(rightWord.count) - rightPos + 1)
                            
                            
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
                                        score: score,
                                        width: width,
                                        height: height,
                                        placements: [
                                            PlacementModel(
                                                id: topRightEdge.h,
                                                x: bottomPos + 1, // made it bottomPos
                                                y: rightPos + 1,
                                                isHorizontal: true),
                                            PlacementModel(
                                                id: bottomLeftEdge.h,
                                                x: 0,
                                                y: rightPos + UInt8(interlockHeight),
                                                isHorizontal: true),
                                            PlacementModel(
                                                id: bottomLeftEdge.v,
                                                x: bottomPos + 1,
                                                y: rightPos + 1,
                                                isHorizontal: false),
                                            PlacementModel(
                                                id: topRightEdge.v,
                                                x: bottomPos + UInt8(interlockWidth),
                                                y: 0,
                                                isHorizontal: false)
                                        ])
//                                                                        let shapeText = DrawShape.draw(shape: shape, wordList: words)
//                                                                        if ShapeValidator.Execute(shape: shape, wordList: words) == false {
//                                                                            print(shapeText)
//                                                                            print("Fix")
//                                                                        }
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
    
    
    // bottom left seems like a duplicate of TopRight
    public static func BottomLeft(edges: [EdgeModel], words: [String], interlockWidth: Int, interlockHeight: Int,  scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
        if interlockWidth == interlockHeight {
            return result
        }
        let topLeftEdges = edges.filter {$0.vPosFromEnd == interlockHeight - 2 && $0.hPosFromEnd >= interlockWidth - 1}
        
        let bottomRightEdges = edges.filter {$0.hPosFromStart == interlockWidth - 2 && $0.vPosFromStart >= interlockHeight - 1}
        
        for topLeftEdge in topLeftEdges {
            for bottomRightEdge in bottomRightEdges {
                
                let topWord = words[Int(topLeftEdge.h)]
                let bottomWord = words[Int(bottomRightEdge.h)]
                let leftWord = words[Int(topLeftEdge.v)]
                let rightWord = words[Int(bottomRightEdge.v)]
                
                let topLeftPos = Int(topLeftEdge.hPosFromStart) + interlockWidth - 1
                let bottomRightPos = Int(bottomRightEdge.vPosFromStart) - interlockHeight + 1
                
                let topLeftLetter = topWord[topLeftPos]
                let bottomRightLetter = rightWord[bottomRightPos]
                
                if topLeftLetter == bottomRightLetter {
                    
                    if topLeftEdge.h != bottomRightEdge.h && topLeftEdge.h != bottomRightEdge.v  &&
                        topLeftEdge.v != bottomRightEdge.h && topLeftEdge.v != bottomRightEdge.v {
                        
                        // The interlocking position for each letter
                        let topPos = topLeftEdge.hPosFromStart
                        let leftPos = topLeftEdge.vPosFromStart
                        let bottomPos = bottomRightEdge.hPosFromStart
                        
                        let rightPos = bottomRightEdge.vPosFromStart - UInt8(interlockHeight - 1)
                        
                        let pattern = String([
                            topWord[Int(topPos)],
                            rightWord[Int(rightPos)],
                            bottomWord[Int(bottomPos)] ])
                        
                        let score = UInt16(ScoreCalculator.score(word: pattern)) + 40
                        
                        if score >= scoreMin {
                            
                            let width = topPos +  max(UInt8(topWord.count) - topPos, UInt8(bottomWord.count + 1)) + 2
                            
                            let maxHeight = max(leftPos, rightPos)
                            let maxHeight2 = max(UInt8(leftWord.count) - leftPos, UInt8(rightWord.count) - rightPos)
                            let height = maxHeight + maxHeight2 + 2
                            
                            if ((width <= widthMax && height <= heightMax) || (height <= widthMax && width <= heightMax)) {
                                
                                let shape = ShapeModel(
                                    score: score,
                                    width: width,
                                    height: height,
                                    placements: [
                                        PlacementModel(
                                            id: topLeftEdge.h,
                                            x: 0,
                                            y: maxHeight + 1,
                                            isHorizontal: true),
                                        PlacementModel(
                                            id: bottomRightEdge.h,
                                            x: topPos + 1,
                                            y: maxHeight + UInt8(interlockHeight),
                                            isHorizontal: true),
                                        PlacementModel(
                                            id: topLeftEdge.v,
                                            x: topPos + 1,
                                            y: maxHeight - leftPos,
                                            isHorizontal: false),
                                        PlacementModel(
                                            id: bottomRightEdge.v,
                                            x: topPos + UInt8(interlockWidth),
                                            y: maxHeight - rightPos,
                                            isHorizontal: false)
                                    ])
                                result.append(shape)
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    
    
    
    
    public static func TopRight(edges: [EdgeModel], words: [String], interlockWidth:Int, interlockHeight:Int, scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
        let topLeftEdges = edges.filter {$0.hPosFromEnd == interlockWidth - 2 && $0.vPosFromEnd >= interlockHeight - 1}
        
        let bottomRightEdges = edges.filter {$0.vPosFromStart == interlockHeight - 2 && $0.hPosFromStart >= interlockWidth - 1}
        
        for topLeftEdge in topLeftEdges {
            for bottomRightEdge in bottomRightEdges {
                
                let topWord = words[Int(topLeftEdge.h)]
                let bottomWord = words[Int(bottomRightEdge.h)]
                let leftWord = words[Int(topLeftEdge.v)]
                let rightWord = words[Int(bottomRightEdge.v)]
                
                let topLeftPos = Int(topLeftEdge.vPosFromStart) + interlockHeight - 1
                let bottomRightPos = Int(bottomRightEdge.hPosFromStart) - interlockWidth + 1
                
                let topLeftLetter = leftWord[Int(topLeftPos)]
                let bottomRightLetter = bottomWord[Int(bottomRightPos)]
                
                if topLeftLetter == bottomRightLetter {
                    
                    if topLeftEdge.h != bottomRightEdge.h && topLeftEdge.h != bottomRightEdge.v  &&
                        topLeftEdge.v != bottomRightEdge.h && topLeftEdge.v != bottomRightEdge.v {
                        
                        // The interlocking position for each letter
                        let topPos = topLeftEdge.hPosFromStart
                        let bottomPos = bottomRightEdge.hPosFromStart - UInt8(interlockWidth - 1 )
                        let leftPos = topLeftEdge.vPosFromStart
                        let rightPos = bottomRightEdge.vPosFromStart
                        
                        let pattern = String([
                            topWord[Int(topPos)],
                            bottomWord[Int(bottomPos)],
                            rightWord[Int(rightPos)] ])
                        
                        let score = UInt16(ScoreCalculator.score(word: pattern)) + 40
                        
                        if score >= scoreMin {
                            let xMax = max(topPos, bottomPos)
                            let width = xMax + UInt8(max(topWord.count - Int(topPos), bottomWord.count - Int(bottomPos) )) + 2
                            
                            let height = leftPos + max(UInt8(leftWord.count) - leftPos,UInt8(rightWord.count) + 1) + 2
                            
                            if ((width <= widthMax && height <= heightMax) || (height <= widthMax && width <= heightMax)) {
                                
                                let shape = ShapeModel(
                                    score: score,
                                    width: width,
                                    height: height,
                                    placements: [
                                        PlacementModel(
                                            id: topLeftEdge.h,
                                            x: xMax - topPos,
                                            y: leftPos + 1,
                                            isHorizontal: true),
                                        PlacementModel(
                                            id: bottomRightEdge.h,
                                            x: xMax - bottomPos,
                                            y: leftPos + UInt8(interlockHeight),
                                            isHorizontal: true),
                                        PlacementModel(
                                            id: topLeftEdge.v,
                                            x: xMax + 1,
                                            y: 0,
                                            isHorizontal: false),
                                        PlacementModel(
                                            id: bottomRightEdge.v,
                                            x: xMax + UInt8(interlockWidth) ,
                                            y: leftPos + 1,
                                            isHorizontal: false)
                                    ])
                                result.append(shape)
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    
    
    
    
    
    /// Using top left and bottom right edges we are looking for a bottom left gap
    ///  xYZ          Z
    ///  A              B
    ///        De
    ///
    ///  xYz
    ///  A  B
    ///   De
    
//    private static func TopLeftBottomRightBottomLeftGap(topLeftEdge: EdgeModel, bottomRightEdge: EdgeModel, words: [String], interlockWidth:Int, interlockHeight:Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
//    {
//        var result: [ShapeModel] = []
//        // The vertical word in the top left Edge "xA", the x is interlockHeight -2 so if interlock hieght is 3 then this is position 1
//        if (topLeftEdge.vPosFromEnd == interlockHeight - 2) {
//            // The horizontal word of the bottom right edge "De" has its interlock of interlock width 3 -2 = 1
//            if (bottomRightEdge.hPosFromStart == interlockWidth - 2) {
//                // is the position of the interlock on xYZ and ZBe leaving enough room to connect to the other edge
//                if (topLeftEdge.hPosFromEnd >= interlockWidth && bottomRightEdge.vPosFromStart >= interlockHeight)
//                {
//                    let topWord = words[Int(topLeftEdge.h)]
//                    let bottomWord = words[Int(bottomRightEdge.h)]
//                    let leftWord = words[Int(topLeftEdge.v)]
//                    let rightWord = words[Int(bottomRightEdge.v)]
//
//
//                    let topLeftHPosition = Int(topLeftEdge.hPosFromStart) + interlockWidth - 1
//                    let bottomRightVPosition = Int(bottomRightEdge.vPosFromStart) - interlockHeight + 1
//
//                    // Get the interlocking letter position
//                    let topLeft_TopRightLetter = topWord[topLeftHPosition];
//                    let bottomRight_TopRightLetter = rightWord[bottomRightVPosition];
//
//                    if (topLeft_TopRightLetter == bottomRight_TopRightLetter)
//                    {
//
//                        let placements = [
//                            PlacementModel(
//                                id: topLeftEdge.h,
//                                x: 0,
//                                y: 0,
//                                isHorizontal: true),
//                            PlacementModel(
//                                id: bottomRightEdge.h,
//                                x: 0,
//                                y: 0,
//                                isHorizontal: true),
//                            PlacementModel(
//                                id: topLeftEdge.v,
//                                x: 0,
//                                y: 0,
//                                isHorizontal: false),
//                            PlacementModel(
//                                id: bottomRightEdge.v,
//                                x: 0,
//                                y: 0,
//                                isHorizontal: false)
//                        ]
//
//                    }
//                }
//            }
//        }
//        return result
//    }
//    private static func TopRightBottomLeft(topRightEdge: EdgeModel, words: [String], bottomLeftEdge: EdgeModel, interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
//    {
//        var result: [ShapeModel] = []
//        // First we process as topLeft bottomRight
//        if (topRightEdge.hPosFromStart >= interlockWidth
//            && topRightEdge.vPosFromEnd >= interlockHeight
//            && bottomLeftEdge.hPosFromEnd >= interlockWidth
//            && bottomLeftEdge.vPosFromStart >= interlockHeight)
//        {
//            let topWord = words[Int(topRightEdge.h)]
//            let bottomWord = words[Int(bottomLeftEdge.h)]
//            let leftWord = words[Int(bottomLeftEdge.v)]
//            let rightWord = words[Int(topRightEdge.v)]
//
//            let topInterlockPos = Int(topRightEdge.hPosFromStart) - interlockWidth + 1;
//            let rightInterlockPos = Int(topRightEdge.vPosFromStart) + interlockHeight - 1;
//            let bottomInterlockPos = Int(bottomLeftEdge.hPosFromStart) + interlockWidth - 1;
//            let leftInterlockPos = Int(bottomLeftEdge.vPosFromStart) - interlockHeight + 1;
//
//            let topInterlockChar = topWord[topInterlockPos];
//            let bottomInterlockChar = bottomWord[bottomInterlockPos];
//            let leftInterlockChar = leftWord[leftInterlockPos];
//            let rightInterlockChar = rightWord[rightInterlockPos];
//
//
//
//            if (topInterlockChar == leftInterlockChar && rightInterlockChar == bottomInterlockChar) {
//
//
//                let placements = [
//                    PlacementModel(
//                        id: topRightEdge.h,
//                        x: 0,
//                        y: 0,
//                        isHorizontal: true),
//                    PlacementModel(
//                        id: bottomLeftEdge.h,
//                        x: 0,
//                        y: 0,
//                        isHorizontal: true),
//                    PlacementModel(
//                        id: topRightEdge.v,
//                        x: 0,
//                        y: 0,
//                        isHorizontal: false),
//                    PlacementModel(
//                        id: bottomLeftEdge.v,
//                        x: 0,
//                        y: 0,
//                        isHorizontal: false)
//                ]
//
//            }
//        }
//        return result
//    }
}

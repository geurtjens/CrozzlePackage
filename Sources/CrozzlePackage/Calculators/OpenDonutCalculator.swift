//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/12/2022.
//

import Foundation

struct OpenDonutCalculator {
    static func IsDuplicate(shape:ShapeModel, startingPos: Int, shapes:[ShapeModel]) -> Bool {
        for j in startingPos..<shapes.count {
//            if shape.h[0] == shapes[j].v[0] && shape.h[1] == shapes[j].v[1] &&
//               shape.v[0] == shapes[j].h[0] && shape.v[1] == shapes[j].h[1]
//            {
                
                //print(shape.text)
                //print(shapes[j].text)
                //print("*******")
                
                return true
                
//            }
        }
        return false
    }
    
    static func RemoveDuplicates(shapes:[ShapeModel]) -> [ShapeModel] {
        var result:[ShapeModel] = []
//        var duplicates:[ShapeModel] = []
//        var duplicateCount = 0
        for i in 0..<shapes.count {
            if IsDuplicate(shape:shapes[i],startingPos:i+1, shapes:shapes) == false {
                result.append(shapes[i])
            }
//            else {
//                duplicates.append(shapes[i])
//                duplicateCount += 1
//            }
        }
        
//        duplicates.sort() {$0.score < $1.score}
//        result.sort() {$0.score < $1.score}
//
        
        return result
    }
    static func Execute(edges: [EdgeModel], words: [String], interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int)
    {
     
        var bottomRightShapes = BottomRight(edges: edges, words: words, interlockWidth: interlockWidth, interlockHeight: interlockHeight, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
       
        // This can have duplicates if width == height
        if interlockWidth == interlockHeight {
            bottomRightShapes = RemoveDuplicates(shapes:bottomRightShapes)
        }
        
        var topLeftShapes = TopLeft(edges: edges, words: words, interlockWidth: interlockWidth, interlockHeight: interlockHeight, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        if interlockWidth == interlockHeight {
            topLeftShapes = RemoveDuplicates(shapes:topLeftShapes)
        }
        
        
        let topRightShapes = TopRight(edges: edges, words: words, interlockWidth: interlockWidth, interlockHeight: interlockHeight, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        // bottom left is a duplicate of top right but only if we have a 3x3 etc were the horizontal and vertical are the same
        var bottomLeftShapes = BottomLeft(edges: edges, words: words, interlockWidth: interlockWidth, interlockHeight: interlockHeight, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        if interlockWidth == interlockHeight {
            bottomLeftShapes = []
        }
        
        
//        var headers:[ClusterModel] = []
//        // topLeft rotates into another top left
//        headers.append(ClusterModel(
//            category: "OpenDonut",
//            type: "TopLeft",
//            items: topLeftShapes,
//            interlockWidth: interlockWidth,
//            interlockHeight:interlockHeight,
//            minScore:scoreMin,
//            maxWidth: widthMax,
//            maxHeight: heightMax,
//            id:"O" + String(interlockWidth) + "x" + String(interlockHeight),
//            wordCount:4));
//
//        headers.append(ClusterModel(
//            category: "OpenDonut",
//            type: "TopRight",
//            items: topRightShapes,
//            interlockWidth: interlockWidth,
//            interlockHeight:interlockHeight,
//            minScore:scoreMin,
//            maxWidth: widthMax,
//            maxHeight: heightMax,
//            id:"O" + String(interlockWidth) + "x" + String(interlockHeight),
//            wordCount:4));
//
//        headers.append(ClusterModel(
//            category: "OpenDonut",
//            type: "BottomLeft",
//            items: bottomLeftShapes,
//            interlockWidth: interlockWidth,
//            interlockHeight:interlockHeight,
//            minScore:scoreMin,
//            maxWidth: widthMax,
//            maxHeight: heightMax,
//            id:"O" + String(interlockWidth) + "x" + String(interlockHeight),
//            wordCount:4));
//
//        headers.append(ClusterModel(
//            category: "OpenDonut",
//            type: "BottomRight",
//            items: bottomRightShapes,
//            interlockWidth: interlockWidth,
//            interlockHeight:interlockHeight,
//            minScore:scoreMin,
//            maxWidth: widthMax,
//            maxHeight: heightMax,
//            id:"O" + String(interlockWidth) + "x" + String(interlockHeight),
//            wordCount:4));
//
//
//        for item in headers {
//            print ("\(item.type) has \(item.items.count)")
//        }
//
        //return headers
        
        
        
        
        //return ExecuteEdges(edges: edges, interlockWidth: interlockWidth, interlockHeight: interlockHeight, minScore: minScore, maxWidth: maxWidth, maxHeight: maxHeight)

    }
//    static func ExecuteEdges( edges: [EdgeModel2], interlockWidth: Int, interlockHeight: Int, minScore: Int, maxWidth: Int, maxHeight: Int) -> [ClusterHeaderModel]
//    {
//        var result: [ShapeModel] = []
//
//        let edgeCount = edges.count
//
//        for a in 0..<edgeCount {
//            for b in 0..<edgeCount {
//                if (a > b) {
//                    let edgeA = edges[a];
//                    let edgeB = edges[b];
//                    if edgeA.h != edgeB.h &&
//                       edgeA.h != edgeB.v &&
//                       edgeA.v != edgeB.h &&
//                       edgeA.v != edgeB.v {
//
//                        //var topLeftEdge = edges[a];
//                        //var bottomRightEdge = edges[b];
//
//                        let a = TopLeftBottomRightTopRightGap(topLeftEdge:edgeA, bottomRightEdge:edgeB, interlockWidth:interlockWidth, interlockHeight:interlockHeight, minScore:minScore,maxWidth: maxWidth, maxHeight:maxHeight)
//                        let b = TopLeftBottomRightTopRightGap(topLeftEdge:edgeB, bottomRightEdge:edgeA, interlockWidth:interlockWidth, interlockHeight:interlockHeight, minScore:minScore, maxWidth:maxWidth, maxHeight:maxHeight);
//                        let c = TopLeftBottomRightBottomLeftGap(topLeftEdge:edgeA, bottomRightEdge: edgeB, interlockWidth:interlockWidth, interlockHeight:interlockHeight, minScore:minScore, maxWidth:maxWidth, maxHeight:maxHeight);
//                        let d = TopLeftBottomRightBottomLeftGap(topLeftEdge:edgeB, bottomRightEdge:edgeA, interlockWidth:interlockWidth, interlockHeight:interlockHeight, minScore:minScore, maxWidth:maxWidth, maxHeight:maxHeight);
//
//                        for item in a {
//                            result.append(item)
//                        }
//                        for item in b {
//                            result.append(item)
//                        }
//                        for item in c {
//                            result.append(item)
//                        }
//                        for item in d {
//                            result.append(item)
//                        }
//                        //TopRightBottomLeftTopRightGap(edgeA, edgeB, interlockWidth, interlockHeight, result, minInterlockScore, maxWidth, maxHeight);
//                        //TopRightBottomLeft(edgeB, edgeA, interlockWidth, interlockHeight, result, minInterlockScore, maxWidth, maxHeight);
//
//                    }
//                }
//            }
//        }
//
//        let sorted = result.sorted() {
//            if $0.score == $1.score {
//                return $0.pattern > $1.pattern
//            }
//            return $0.score > $1.score
//        }
//        var header:[ClusterHeaderModel] = []
//        header.append(ClusterHeaderModel( category: "OpenDonut", type: "", items: sorted, interlockWidth: interlockWidth, interlockHeight:interlockHeight,
//                                          minScore:minScore,
//                                        maxWidth: maxWidth,
//                                          maxHeight: maxHeight));
//
//        return header;
//
//    }


//    // This one is done and over to next one.
//    private static func TopLeftBottomRightTopRightGap(topLeftEdge:EdgeModel2, bottomRightEdge: EdgeModel2, interlockWidth:Int, interlockHeight:Int,  minScore: Int, maxWidth: Int, maxHeight: Int) -> [ShapeModel]
//    {
//        var result:[ShapeModel] = []
//        // First we process as topLeft bottomRight
//        if (topLeftEdge.hPosFromEnd == interlockWidth - 2 && topLeftEdge.vPosFromEnd >= interlockHeight && bottomRightEdge.hPosFromStart >= interlockWidth && bottomRightEdge.vPosFromStart == interlockHeight - 2)
//        {
//            // this calculation is when the gap is top left
//            //let topLeftH = topLeftEdge.horizontal[topLeftEdge.hPosFromStart + interlockWidth - 1];
//            let topLeftV = topLeftEdge.vertical[topLeftEdge.vPosFromStart + interlockHeight - 1];
//
//            let bottomRightH = bottomRightEdge.horizontal[bottomRightEdge.hPosFromStart - interlockWidth + 1];
//            //let bottomRightV = bottomRightEdge.vertical[bottomRightEdge.vPosFromStart - interlockHeight + 1];
//
//            if (topLeftV == bottomRightH)
//            {
//                let topWord = WordCalc.Edge(word:topLeftEdge.horizontal, pos:topLeftEdge.hPosFromStart + interlockWidth - 1);
//                let leftWord = WordCalc.Edge(word:topLeftEdge.vertical, pos:topLeftEdge.vPosFromStart + interlockHeight - 1);
//                let bottomWord = WordCalc.Edge(word:bottomRightEdge.horizontal, pos:bottomRightEdge.hPosFromStart - interlockWidth + 1);
//                let rightWord = WordCalc.Edge(word:bottomRightEdge.vertical, pos:bottomRightEdge.vPosFromStart - interlockHeight + 1);
//
//
//                let pattern = String(topLeftEdge.letter) + String(bottomRightEdge.letter) + String(topLeftV)
//
//                let hid = [ topLeftEdge.h, bottomRightEdge.h ]
//                let vid = [ topLeftEdge.v, bottomRightEdge.v ]
//                let h = [ topWord, bottomWord ]
//                let v = [ leftWord, rightWord ]
//
//                let shape = CreateShape(pattern: pattern, h: h, v: v, hid: hid, vid: vid, interlockWidth: interlockWidth, interlockHeight: interlockHeight, minScore: minScore, maxWidth: maxWidth, maxHeight: maxHeight)
//                if shape != nil {
//                    result.append(shape!)
//                }
//            }
//        }
//        return result
//    }

    
    public static func BottomRight(edges:[EdgeModel], words: [String], interlockWidth:Int, interlockHeight:Int,  scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
        let topRightEdges = edges.filter {$0.vPosFromEnd == interlockHeight - 2 && $0.hPosFromStart >= interlockWidth - 1}
        
        let bottomLeftEdges = edges.filter {$0.hPosFromEnd == interlockWidth - 2 && $0.vPosFromStart >= interlockHeight - 1}
        
        for topRightEdge in topRightEdges {
            for bottomLeftEdge in bottomLeftEdges {
                
                let topWord = words[Int(topRightEdge.h)]
                let leftWord = words[Int(bottomLeftEdge.v)]
                let rightWord = words[Int(topRightEdge.v)]
                let bottomWord = words[Int(bottomLeftEdge.h)]
                
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
                        
                        
                        let placements = [
                            PlacementModel(
                                id: topRightEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: bottomLeftEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: topRightEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false),
                            PlacementModel(
                                id: bottomLeftEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false)
                        ]
         

//                        let pattern = String(topRightLetter) + String(topRightEdge.letter) + String(bottomLeftEdge.letter)
//
//                        let score = ScoreCalculator.score(word: pattern) + 40
//
                        
                        
//                        let shape = CreateShape(pattern: pattern, h: h, v: v, hid: hid, vid: vid, interlockWidth: interlockWidth, interlockHeight: interlockHeight, minScore: minScore, maxWidth: maxWidth, maxHeight: maxHeight)
//                        if shape != nil {
//                            result.append(shape!)
//                        }
                    }
                }
            }
        }
        
        return result
    }
    
    
    public static func TopLeft(edges: [EdgeModel], words: [String], interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
        let topRightEdges = edges.filter {$0.hPosFromStart == interlockWidth - 2 && $0.vPosFromEnd >= interlockHeight - 1}
        
        let bottomLeftEdges = edges.filter {$0.vPosFromStart == interlockHeight - 2 && $0.hPosFromEnd >= interlockWidth - 1}
        
        for topRightEdge in topRightEdges {
            for bottomLeftEdge in bottomLeftEdges {
                
                let topWord = words[Int(topRightEdge.h)]
                let bottomWord = words[Int(bottomLeftEdge.h)]
                let leftWord = words[Int(bottomLeftEdge.v)]
                let rightWord = words[Int(topRightEdge.v)]
                
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
                         

//                        let pattern = String(topRightEdge.letter) + String(bottomLeftEdge.letter) + String(topRightLetter)
//
//                        let score = ScoreCalculator.score(word: pattern) + 40
                        
                        let placements = [
                            PlacementModel(
                                id: topRightEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: bottomLeftEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: bottomLeftEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false),
                            PlacementModel(
                                id: topRightEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false)
                        ]
                        
                        
                        
                        
                        
//                        let shape = CreateShape(pattern: pattern, h: h, v: v, hid: hid, vid: vid, interlockWidth: interlockWidth, interlockHeight: interlockHeight, minScore: scoreMin, maxWidth: widthMax, maxHeight: heightMax)
//                        if shape != nil {
//                            result.append(shape!)
//                        }
                    }
                }
            }
        }
        
        return result
    }
    
    
    // bottom left seems like a duplicate of TopRight
    public static func BottomLeft(edges: [EdgeModel], words: [String], interlockWidth: Int, interlockHeight: Int,  scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
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
                        
                        //let pattern = String(topLeftEdge.letter) + String(bottomRightEdge.letter) + String(topLeftLetter)

                        
                        let placements = [
                            PlacementModel(
                                id: topLeftEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: bottomRightEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: topLeftEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false),
                            PlacementModel(
                                id: bottomRightEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false)
                        ]
                        
                         
//                        let shape = CreateShape(pattern: pattern, h: h, v: v, hid: hid, vid: vid, interlockWidth: interlockWidth, interlockHeight: interlockHeight, minScore: minScore, maxWidth: maxWidth, maxHeight: maxHeight)
//                        if shape != nil {
//                            result.append(shape!)
//                        }
                    }
                }
            }
        }
        
        return result
    }
    
    
    
    
    public static func TopRight(edges: [EdgeModel], words: [String], interlockWidth:Int, interlockHeight:Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
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
                        
                        
                        let placements = [
                            PlacementModel(
                                id: topLeftEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: bottomRightEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: topLeftEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false),
                            PlacementModel(
                                id: bottomRightEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false)
                        ]
                        
         

                        //let pattern = String(topLeftEdge.letter) + String(bottomRightEdge.letter) + String(topLeftLetter)

                       
                        
//                        let shape = CreateShape(pattern: pattern, h: h, v: v, hid: hid, vid: vid, interlockWidth: interlockWidth, interlockHeight: interlockHeight, minScore: minScore, maxWidth: maxWidth, maxHeight: maxHeight)
//                        if shape != nil {
//                            result.append(shape!)
//                        }
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
    
    private static func TopLeftBottomRightBottomLeftGap(topLeftEdge: EdgeModel, bottomRightEdge: EdgeModel, words: [String], interlockWidth:Int, interlockHeight:Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        // The vertical word in the top left Edge "xA", the x is interlockHeight -2 so if interlock hieght is 3 then this is position 1
        if (topLeftEdge.vPosFromEnd == interlockHeight - 2) {
            // The horizontal word of the bottom right edge "De" has its interlock of interlock width 3 -2 = 1
            if (bottomRightEdge.hPosFromStart == interlockWidth - 2) {
                // is the position of the interlock on xYZ and ZBe leaving enough room to connect to the other edge
                if (topLeftEdge.hPosFromEnd >= interlockWidth && bottomRightEdge.vPosFromStart >= interlockHeight)
                {
                    let topWord = words[Int(topLeftEdge.h)]
                    let bottomWord = words[Int(bottomRightEdge.h)]
                    let leftWord = words[Int(topLeftEdge.v)]
                    let rightWord = words[Int(bottomRightEdge.v)]
                    
                    
                    let topLeftHPosition = Int(topLeftEdge.hPosFromStart) + interlockWidth - 1
                    let bottomRightVPosition = Int(bottomRightEdge.vPosFromStart) - interlockHeight + 1
                    
                    // Get the interlocking letter position
                    let topLeft_TopRightLetter = topWord[topLeftHPosition];
                    let bottomRight_TopRightLetter = rightWord[bottomRightVPosition];

                    if (topLeft_TopRightLetter == bottomRight_TopRightLetter)
                    {
                        
                        let placements = [
                            PlacementModel(
                                id: topLeftEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: bottomRightEdge.h,
                                x: 0,
                                y: 0,
                                isHorizontal: true),
                            PlacementModel(
                                id: topLeftEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false),
                            PlacementModel(
                                id: bottomRightEdge.v,
                                x: 0,
                                y: 0,
                                isHorizontal: false)
                        ]

                        //let pattern = String(topLeftEdge.letter) + String(topLeft_TopRightLetter) + String(bottomRightEdge.letter)
                        
                       
                        
                        
//                        let shape = CreateShape(pattern: pattern, h: h, v: v, hid: hid, vid: vid, interlockWidth: interlockWidth, interlockHeight: interlockHeight, minScore: minScore, maxWidth: maxWidth, maxHeight: maxHeight)
//                        if shape != nil {
//                            result.append(shape!)
//                        }
                    }
                }
            }
        }
        return result
    }
    private static func TopRightBottomLeft(topRightEdge: EdgeModel, words: [String], bottomLeftEdge: EdgeModel, interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        // First we process as topLeft bottomRight
        if (topRightEdge.hPosFromStart >= interlockWidth
            && topRightEdge.vPosFromEnd >= interlockHeight
            && bottomLeftEdge.hPosFromEnd >= interlockWidth
            && bottomLeftEdge.vPosFromStart >= interlockHeight)
        {
            let topWord = words[Int(topRightEdge.h)]
            let bottomWord = words[Int(bottomLeftEdge.h)]
            let leftWord = words[Int(bottomLeftEdge.v)]
            let rightWord = words[Int(topRightEdge.v)]
            
            let topInterlockPos = Int(topRightEdge.hPosFromStart) - interlockWidth + 1;
            let rightInterlockPos = Int(topRightEdge.vPosFromStart) + interlockHeight - 1;
            let bottomInterlockPos = Int(bottomLeftEdge.hPosFromStart) + interlockWidth - 1;
            let leftInterlockPos = Int(bottomLeftEdge.vPosFromStart) - interlockHeight + 1;

            let topInterlockChar = topWord[topInterlockPos];
            let bottomInterlockChar = bottomWord[bottomInterlockPos];
            let leftInterlockChar = leftWord[leftInterlockPos];
            let rightInterlockChar = rightWord[rightInterlockPos];
            


            if (topInterlockChar == leftInterlockChar && rightInterlockChar == bottomInterlockChar) {
                
                
                let placements = [
                    PlacementModel(
                        id: topRightEdge.h,
                        x: 0,
                        y: 0,
                        isHorizontal: true),
                    PlacementModel(
                        id: bottomLeftEdge.h,
                        x: 0,
                        y: 0,
                        isHorizontal: true),
                    PlacementModel(
                        id: topRightEdge.v,
                        x: 0,
                        y: 0,
                        isHorizontal: false),
                    PlacementModel(
                        id: bottomLeftEdge.v,
                        x: 0,
                        y: 0,
                        isHorizontal: false)
                ]

               //let pattern = String(topInterlockChar) + String(topRightEdge.letter) + String(bottomLeftEdge.letter) + String(rightInterlockChar)
                
                let hid = [ topRightEdge.h, bottomLeftEdge.h ]
                let vid = [ bottomLeftEdge.v,topRightEdge.v ]
                let h = [ topWord, bottomWord ]
                let v = [ leftWord, rightWord ]
                
//                let shape = CreateShape(pattern: pattern, h: h, v: v, hid: hid, vid: vid, interlockWidth: interlockWidth, interlockHeight: interlockHeight, minScore: minScore, maxWidth: maxWidth, maxHeight: maxHeight)
//                if shape != nil {
//                    result.append(shape!)
//                }
            }
        }
        return result
    }
    
    
//    static func CreateShape(pattern:String, h:[String], v:[String], hid:[UInt8], vid:[UInt8], interlockWidth: Int, interlockHeight: Int, scoreMin: Int,widthMax: Int, heightMax: Int) -> ShapeModel? {
//        let interlockScore = ScoreCalculator.WordScore(word:pattern)
//        let wordsInShape = h.count + v.count
//        let score = interlockScore + 10 * wordsInShape
//
//
//        if score >= minScore {
//            let text = ShapeTextCalculator.Execute(name: "OpenDonut", horizontalWords: h, verticalWords: v)
//            let grid = ShapeCalculator.convertTextToArray(text:text)
//
//            let height = grid.count
//            let width = grid[0].count
//
//            if (height <= widthMax && width <= heightMax) ||
//               (height <= heightMax && width <= widthMax) {
//
//                let hPos = ShapeCalculator.FindHorizontalPositions(horizontalWords:h, grid:grid)
//
//                let vPos = ShapeCalculator.FindVerticalPositions(verticalWords:v, grid:grid)
//
//                // We should try to judge if this is a duplicate or not
//                let size = GridPositionModel(y:height, x:width)
//                let potential = PotentialCalculator.Execute(horizontalWords: h, verticalWords: v)
//
//                let cluster = ShapeModel(
//                    name: "OpenDonut\(interlockWidth)x\(interlockHeight)",
//                    h: h,
//                    v: v,
//                    pattern: pattern,
//                    id:0,
//                    score: score,
//                    potential:potential,
//                    text: text,
//                    grid: grid,
//                    hPos: hPos,
//                    vPos: vPos,
//                    size: size,
//                    hid: hid,
//                    vid: vid
//                )
//                return cluster
//            }
//        }
//        return nil
//    }
}

//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 5/1/2023.
//

import Foundation
public class ShapeMakerCalculator {
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let w = WordModelSOA(words: words)
        
        let c1x1 = EdgeToShapeConverter.toShape(fromEdges: EdgeCalculator.findEdges(fromWordList: words), usingWords: words, scoreMin: UInt16(scoreMin), widthMax: UInt8(widthMax), heightMax: UInt8(heightMax))
        print("Edges: \(c1x1.count)")
        
        let c2x2 = C2x2.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x3 = C2x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x4 = C2x4.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x5 = C2x5.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x6 = C2x6.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x3 = C3x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x4 = C3x4.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x5 = C3x5.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x6 = C3x6.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let clusterShapes = [c1x1, c2x2, c2x3, c2x4, c2x5, c2x6, c3x3, c3x4, c3x5, c3x6].flatMap{ $0 }

        let edges = EdgeCalculator.findValidEdges(fromWordList: words, scoreMin: UInt16(scoreMin), widthMax: UInt8(widthMax), heightMax: UInt8(heightMax))
        
        let donuts = GetAllDonuts(edges:edges, words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let openDonuts = GetAllOpenDonuts(edges: edges, words: words, scoreMin: UInt16(scoreMin), widthMax: UInt8(widthMax), heightMax: UInt8(heightMax))
        
        var result = [clusterShapes, donuts, openDonuts].flatMap { $0 }

        result.sort { $0.s > $1.s }
        
        return result
        
    }
    
    public static func GetAllDonuts(edges: [EdgeModel], words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        let donutInterlocks: [(Int,Int)] = [(3,3), (3,4), (3,5), (3,6), (4,4), (4,5), (4,6), (5,5), (5,6), (6,6)]
        
        var result: [[ShapeModel]] = []
        for item in donutInterlocks {
            let shapes = DonutCalculator.ExecuteEdges(edges: edges, wordList: words, interlockWidth: item.0, interlockHeight: item.1, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            if shapes.count > 0 {
                result.append(shapes)
            }
        }

        return result.flatMap { $0 }
        
    }
    
    public static func GetAllOpenDonuts(edges: [EdgeModel], words: [String], scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel] {
        let openDonutSizes: [(Int, Int)] = [(3,3), (3,4), (3,5), (3,6), (4,4), (4,5), (4,6), (5,5), (5,6), (6,6)]
        var result: [[ShapeModel]] = []
        for item in openDonutSizes {
            let shapes = OpenDonutCalculator.Execute(edges: edges, words: words, interlockWidth: item.0, interlockHeight: item.1, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            if shapes.count > 0 {
                result.append(shapes)
            }
        }
        
        return result.flatMap { $0 }
        
    }
}

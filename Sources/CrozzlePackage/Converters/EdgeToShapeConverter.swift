//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 17/12/2022.
//

import Foundation
/// Converts a list of edges to a list of shapes
public class EdgeToShapeConverter {

    
    
    public static func toShapeDuplicate(fromEdges edges: [EdgeModel], usingWords wordList: [String], scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel] {
        
        let shapes = toShape(fromEdges:edges,usingWords: wordList, scoreMin: scoreMin, widthMax:widthMax,heightMax:heightMax)
        let shapesReversed = toShapeReversed(fromEdges:edges,usingWords: wordList, scoreMin: scoreMin, widthMax:widthMax,heightMax:heightMax)
        
        let allShapes = shapes + shapesReversed
        
        let sorted = allShapes.sorted { $0.s > $1.s}
        
        return sorted
    }
    
    
    /// Convert the list of edges into the shape array
    /// - Parameters:
    ///   - edges: Edges are a valid set of shapes combined at one letter
    ///   - wordList: A set of words used when we calculated the edges
    /// - Returns: An array of ShapeModels which is a standard structure to represent any valid crozzle game or shape
    public static func toShape(fromEdges edges: [EdgeModel], usingWords wordList: [String], scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel] {
        var result: [ShapeModel] = []
        result.reserveCapacity(edges.count)
        
        for edge in edges {
            let horizontalWord = wordList[Int(edge.h)]
            let verticalWord = wordList[Int(edge.v)]
            
            let width = UInt8(horizontalWord.count) + 2
            let height = UInt8(verticalWord.count) + 2
            let score = ScoreCalculator.score(forEdgeWithLetter: horizontalWord[Int(edge.hPosFromStart)])
            
            if score >= scoreMin && ((width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax)) {
                
                let shape = ShapeModel(
                    s: UInt16(score),
                    w:width,
                    h:height,
                    p: [
                        PlacementModel(
                            id: edge.h,
                            x: 0,
                            y: edge.vPosFromStart + 1,
                            isHorizontal: true),
                        PlacementModel(
                            id: edge.v,
                            x: edge.hPosFromStart + 1,
                            y: 0,
                            isHorizontal: false)
                    ]
                )
                result.append(shape)
            }
        }
        return result
    }
    
    public static func toShape(fromEdge edge: EdgeModel, usingWords wordList: [String], scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> ShapeModel? {
        
        
        
        let horizontalWord = wordList[Int(edge.h)]
        let verticalWord = wordList[Int(edge.v)]
        
        let width = UInt8(horizontalWord.count) + 2
        let height = UInt8(verticalWord.count) + 2
        let score = ScoreCalculator.score(forEdgeWithLetter: horizontalWord[Int(edge.hPosFromStart)])
        
        if score >= scoreMin && ((width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax)) {
            
            let shape = ShapeModel(
                s: UInt16(score),
                w:width,
                h:height,
                p: [
                    PlacementModel(
                        id: edge.h,
                        x: 0,
                        y: edge.vPosFromStart + 1,
                        isHorizontal: true),
                    PlacementModel(
                        id: edge.v,
                        x: edge.hPosFromStart + 1,
                        y: 0,
                        isHorizontal: false)
                ]
            )
            
            return shape
        } else {
            // Its not the right size so dont add it
            return nil
        }
    }
    
    public static func toShapeReversed(fromEdges edges: [EdgeModel], usingWords wordList: [String], scoreMin: UInt16, widthMax: UInt8, heightMax: UInt8) -> [ShapeModel] {
        var result: [ShapeModel] = []
        result.reserveCapacity(edges.count)
        
        for edge in edges {
            let horizontalWord = wordList[Int(edge.v)]
            let verticalWord = wordList[Int(edge.h)]
            
            let width = UInt8(horizontalWord.count) + 2
            let height = UInt8(verticalWord.count) + 2
            let score = ScoreCalculator.score(forEdgeWithLetter: horizontalWord[Int(edge.hPosFromStart)])
            
            if score >= scoreMin && ((width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax)) {
                
                let shape = ShapeModel(
                    s: UInt16(score),
                    w:width,
                    h:height,
                    p: [
                        PlacementModel(
                            id: edge.v,
                            x: 0,
                            y: edge.hPosFromStart + 1,
                            isHorizontal: true),
                        PlacementModel(
                            id: edge.h,
                            x: edge.vPosFromStart + 1,
                            y: 0,
                            isHorizontal: false)
                    ]
                )
                result.append(shape)
            }
        }
        return result
    }
}

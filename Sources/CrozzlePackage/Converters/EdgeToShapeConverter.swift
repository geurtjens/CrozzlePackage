//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 17/12/2022.
//

import Foundation
/// Converts a list of edges to a list of shapes
public class EdgeToShapeConverter {

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
                    score: UInt16(score),
                    width:width,
                    height:height,
                    placements: [
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
}

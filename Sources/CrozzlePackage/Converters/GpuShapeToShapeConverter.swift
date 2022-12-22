//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 19/12/2022.
//

import Foundation
public class GpuShapeToShapeConverter {
    
    
    public static func filter(shapes: [ShapeModel], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        return shapes.filter { $0.score >= scoreMin && ($0.width <= widthMax && $0.height <= heightMax) || ($0.width <= heightMax && $0.height <= widthMax)}
    }
    
    public static func shapeCreation(gpuShape: GpuShapeModel, wordList: [String]) -> [ShapeModel] {
        
        var shapes: [ShapeModel] = []
        
        for shapeId in 0..<gpuShape.count {
            let start = shapeId * Int(gpuShape.stride)
            
            var placements: [PlacementModel] = []
            for i in 0..<gpuShape.stride {
                
                let wordPos = start + Int(i)
                
                let placement = PlacementModel(
                    id: gpuShape.id[wordPos],
                    x: gpuShape.x[wordPos],
                    y: gpuShape.y[wordPos],
                    isHorizontal: gpuShape.isHorizontal[wordPos]
                )
                placements.append(placement)
            }
            let shape = ShapeModel(
                score: gpuShape.score[shapeId],
                width: gpuShape.width[shapeId],
                height: gpuShape.height[shapeId],
                placements: placements
            )
            shapes.append(shape)
        }
        return shapes
    }
}

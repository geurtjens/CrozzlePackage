//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 19/12/2022.
//

import Foundation
public class GpuShapeToShapeConverter {
    
    
    public static func filter(shapes: [ShapeModel], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        return shapes.filter { $0.s >= scoreMin && ($0.w <= widthMax && $0.h <= heightMax) || ($0.w <= heightMax && $0.h <= widthMax)}
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
                s: gpuShape.score[shapeId],
                w: gpuShape.width[shapeId],
                h: gpuShape.height[shapeId],
                p: placements
            )
            shapes.append(shape)
        }
        return shapes
    }
}

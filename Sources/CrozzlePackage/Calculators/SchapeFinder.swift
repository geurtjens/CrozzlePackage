//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 24/12/2022.
//

import Foundation
public class ShapeFinder {

    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [SearchableShapeModel] {
        
        let w = WordModelSOA(words: words)
        
        let edges = EdgeToShapeConverter.toShape(fromEdges: EdgeCalculator.findEdges(fromWordList: words), usingWords: words, scoreMin: UInt16(scoreMin), widthMax: UInt8(widthMax), heightMax: UInt8(heightMax))
        print("Edges: \(edges.count)")
        
        let c2x2 = C2x2.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x3 = C2x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x4 = C2x4.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x5 = C2x5.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x6 = C2x6.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x3 = C3x3.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x4 = C3x4.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x5 = C3x5.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c3x6 = C3x6.Execute(w: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let maxWordId = words.count
        
        let shapes6 = [c2x4, c3x3].flatMap{ $0 }
        let shapes7 = [c2x5, c3x4].flatMap{ $0 }
        let shapes8 = [c2x6, c3x5].flatMap{ $0 }
        
        let words2 = ToSearchableShape.from(shapes: edges,   numberOfWordsInEachShape: 2, maxWordId: maxWordId)
        let words4 = ToSearchableShape.from(shapes: c2x2,    numberOfWordsInEachShape: 4, maxWordId: maxWordId)
        let words5 = ToSearchableShape.from(shapes: c2x3,    numberOfWordsInEachShape: 5, maxWordId: maxWordId)
        let words6 = ToSearchableShape.from(shapes: shapes6, numberOfWordsInEachShape: 6, maxWordId: maxWordId)
        let words7 = ToSearchableShape.from(shapes: shapes7, numberOfWordsInEachShape: 7, maxWordId: maxWordId)
        let words8 = ToSearchableShape.from(shapes: shapes8, numberOfWordsInEachShape: 8, maxWordId: maxWordId)
        let words9 = ToSearchableShape.from(shapes: c3x6,    numberOfWordsInEachShape: 9, maxWordId: maxWordId)
        
        var result: [SearchableShapeModel] = []
        
        if words2.shapeCount > 0 {
            result.append(words2)
        }
        
        if words4.shapeCount > 0 {
            result.append(words4)
        }
        
        if words5.shapeCount > 0 {
            result.append(words5)
        }
        
        if words6.shapeCount > 0 {
            result.append(words6)
        }
        
        if words7.shapeCount > 0 {
            result.append(words7)
        }
        
        if words8.shapeCount > 0 {
            result.append(words8)
        }
        
        if words9.shapeCount > 0 {
            result.append(words9)
        }
        
        return result
    }
    
}

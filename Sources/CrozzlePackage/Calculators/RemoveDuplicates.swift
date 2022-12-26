//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2022.
//

import Foundation
public class RemoveDuplicates {
    
    
    public static func FindDuplicates2x2(size: Int, stride: Int, wordId: [UInt8]) -> [Bool] {
        var duplicates:[Bool] = Array(repeating: false, count: size)
        
        for _i in 0..<size {
            let i = _i * stride
            
            for _j in (_i+1)..<size {
                let j = _j * stride
                    
                if wordId[i] == wordId[j+2] &&
                    wordId[i+1] == wordId[j+3] &&
                    wordId[i+2] == wordId[j] &&
                    wordId[i+3] == wordId[j+1] {

                    duplicates[_j] = true
                }
            }
        }
        return duplicates
    }
    
    public static func FindDuplicates3x3(size: Int, wordId: [UInt8]) -> [Bool] {
        var duplicates:[Bool] = Array(repeating: false, count: size)
        
        let stride = 6
        
        for _i in 0..<size {
            let i = _i * stride
            
            for _j in (_i+1)..<size {
                let j = _j * stride
                    
                if  wordId[i+0] == wordId[j+3] &&
                    wordId[i+1] == wordId[j+4] &&
                    wordId[i+2] == wordId[j+5] &&
                        
                    wordId[i+3] == wordId[j] &&
                    wordId[i+4] == wordId[j+1] &&
                    wordId[i+5] == wordId[j+2] {

                    duplicates[_j] = true
                }
            }
        }
        return duplicates
    }
    
    
    public static func FilterUnique(duplicates:[Bool], wordId:[UInt8], existingSize: Int, stride:Int, uniqueSize: Int ) -> [UInt8] {
        var result: [UInt8] = Array(repeating: 0, count: uniqueSize * stride)
        
        var destinationStart = 0
        var sourceStart = 0
        for i in 0..<existingSize {
            if duplicates[i] == false {
                for j in 0..<stride {
                    result[destinationStart + j] = wordId[sourceStart + j]
                }
                destinationStart += stride
            }
            sourceStart += stride
        }
        return result
    }
    
    public static func FilterUnique2(duplicates: [Bool], wordId: [UInt8], startPos: [UInt8], existingSize: Int, stride: Int, uniqueSize: Int ) -> ([UInt8], [UInt8]) {
        var result: [UInt8] = Array(repeating: 0, count: uniqueSize * stride)
        var result2: [UInt8] = Array(repeating: 0, count: uniqueSize * stride)
        var destinationStart = 0
        var sourceStart = 0
        for i in 0..<existingSize {
            if duplicates[i] == false {
                for j in 0..<stride {
                    result[destinationStart + j] = wordId[sourceStart + j]
                    result2[destinationStart + j] = startPos[sourceStart + j]
                }
                destinationStart += stride
            }
            sourceStart += stride
        }
        return (result, result2)
    }
    
    public static func RemoveDuplicates2x2(cluster: ClusterModel) -> ClusterModel {
        let duplicates:[Bool] = FindDuplicates2x2(size: cluster.size, stride: cluster.stride, wordId: cluster.wordId)

        let uniqueShapeCount = duplicates.filter { $0 == false }.count
        
        let uniqueShapes:[UInt8] = FilterUnique(duplicates:duplicates,
                                                wordId: cluster.wordId,
                                                existingSize: cluster.size,
                                                stride: cluster.stride,
                                                uniqueSize:uniqueShapeCount)
        
        let cluster = ClusterModel(wordId: uniqueShapes,
                                   outerStart: [], // Not sure what to do with this exception yet
                                   patternHorizontal: cluster.patternHorizontal,
                                   patternVertical: cluster.patternVertical,
                                   interlockWidth: cluster.interlockWidth,
                                   interlockHeight: cluster.interlockHeight,
                                   stride: cluster.stride,
                                   size: uniqueShapeCount)
 
        return cluster
    }
    
    public static func RemoveDuplicates3x3(cluster: ClusterModel) -> ClusterModel {
        let duplicates:[Bool] = FindDuplicates3x3(size: cluster.size, wordId: cluster.wordId)

        let uniqueShapeCount = duplicates.filter { $0 == false }.count
        
        let uniqueShapes:[UInt8] = FilterUnique(duplicates:duplicates,
                                                wordId: cluster.wordId,
                                                existingSize: cluster.size,
                                                stride: cluster.stride,
                                                uniqueSize:uniqueShapeCount)
        
        let cluster = ClusterModel(wordId: uniqueShapes,
                                   outerStart: [], // Not sure what to do with this exception yet
                                   patternHorizontal: cluster.patternHorizontal,
                                   patternVertical: cluster.patternVertical,
                                   interlockWidth: cluster.interlockWidth,
                                   interlockHeight: cluster.interlockHeight,
                                   stride: cluster.stride,
                                   size: uniqueShapeCount)
 
        return cluster
    }
}

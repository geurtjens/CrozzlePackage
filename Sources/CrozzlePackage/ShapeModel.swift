//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 4/12/2022.
//

import Foundation
public struct ShapeModel {
    let width: UInt8
    let height: UInt8
    
    let wordIdArray: [UInt8]
    let wordOrientationArray: [Bool]
    
    let xStartArray: [UInt8]
    let yStartArray: [UInt8]
}

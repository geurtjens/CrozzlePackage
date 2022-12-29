//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 29/12/2022.
//

import Foundation

/// This structure is all static sized and so it should fit nicely into memory space so we can make an array of these and know their exact size to reserve
struct SquareModel {

    let score: UInt16
    let width: UInt8
    let height: UInt8
    
    let topId: UInt8
    let topStartPos: UInt8
    let topX: UInt8
    let topY: UInt8
    
    let bottomId: UInt8
    let bottomStartPos: UInt8
    let bottomX: UInt8
    let bottomY: UInt8

    let leftId: UInt8
    let leftStartPos: UInt8
    let leftX: UInt8
    let leftY: UInt8
    
    let rightId: UInt8
    let rightStartPos: UInt8
    let rightX: UInt8
    let rightY: UInt8

    
}

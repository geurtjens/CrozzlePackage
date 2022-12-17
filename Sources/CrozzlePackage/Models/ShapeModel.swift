//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 4/12/2022.
//

import Foundation
/// Any shape or even a complete game can be represented in this form
public struct ShapeModel {

    /// The score attributed to this shape as it pertains to crozzle rules
    public let score: UInt16
    
    /// The width of the shape including any blocking characters at the end of the words.
    public let width: UInt8
    
    /// The height of the shape  including any blocking characters.
    public let height: UInt8

    /// The words and how they should be placed into the grid according to the local coordinate system of the shape
    public let placements: [PlacementModel]
}


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
    public let s: UInt16
    
    /// The width of the shape including any blocking characters at the end of the words.
    public let w: UInt8
    
    /// The height of the shape  including any blocking characters.
    public let h: UInt8

    /// The words and how they should be placed into the grid according to the local coordinate system of the shape
    public let p: [PlacementModel]
    
    public func ToString() -> String {
        var placements = ""
        for placement in p {
            if placements != "" {
                placements += ","
            }
            
            var isHorizontal = 0
            if placement.isHorizontal == true {
                isHorizontal = 1
            }
                
            placements += "{\"i\":\(placement.id),\"x\":\(placement.x),\"y\":\(placement.y),\"h\":\(isHorizontal)}"
            
        }
        let result = "{\"s\":\(s),\"w\":\(w),\"h\":\(h),\"p\":[" + placements + "]}"
        return result
    }
}


//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 4/12/2022.
//

import Foundation
/// Stores enough info to store an edge.  Useful only if you have the original word list ordering
public struct EdgeModel {
    /// First word in the edge
    public let word1: UInt8
    
    /// Letter within the first word that is being interlocked
    public let letterPosition1: UInt8
    
    /// Second word in the edge
    public let word2: UInt8
    
    /// Letter within the second word that is being interlocked
    public let letterPosition2: UInt8
    
}

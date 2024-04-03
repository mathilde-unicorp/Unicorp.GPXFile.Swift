//
//  File.swift
//  
//
//  Created by Ressier Mathilde on 02/04/2024.
//

import Foundation

extension GPXData {
    enum GPXKeys: String {
        case trackpoint = "trkpt"
        case waypoint = "wpt"
        
        case author
        case url
        case time
        case name
    }
}

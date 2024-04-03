//
//  GPXData.swift
//
//
//  Created by Ressier Mathilde on 02/04/2024.
//

import Foundation
import MapKit

public struct GPXData: CustomDebugStringConvertible {

    // properties of the xml file
    public var author: String?
    public var url: String?
    public var time: Date?
    public var name: String?

    // properties computed by our parser
    public var trackpoints = [Trackpoint]()
    public var waypoints = [Waypoint]()

    public var debugDescription: String {
        return "Author: \(author), url: \(url), name: \(name). Route has: \(trackpoints.count) points. Number of Waypoints: \(waypoints.count)"
    }
}

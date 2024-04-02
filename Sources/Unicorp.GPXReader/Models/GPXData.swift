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
    public var route = [CLLocationCoordinate2D]()
    public var waypoints = [Waypoint]()

    public var debugDescription: String {
        return "Author: \(author), url: \(url), name: \(name). Route has: \(route.count) points. Number of Waypoints: \(waypoints.count)"
    }
}
// to display a waypoint I need some more info so I made a separate struct
public struct Waypoint: Identifiable {
    public let id = UUID()
    public var name: String = ""
    public var coord: CLLocationCoordinate2D
}

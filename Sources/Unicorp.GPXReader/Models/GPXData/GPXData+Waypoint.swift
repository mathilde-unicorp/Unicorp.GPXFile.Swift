//
//  GPXData+Waypoint.swift
//
//
//  Created by Ressier Mathilde on 03/04/2024.
//

import Foundation
import MapKit

extension GPXData {

    public struct Waypoint {
        public let coordinates: CLLocationCoordinate2D

        // -------------------------------------------------------------------------
        // MARK: - Init
        // -------------------------------------------------------------------------

        init(coordinates: CLLocationCoordinate2D) {
            self.coordinates = coordinates
        }

        init?(attributes: [String: Any]) {
            guard let coordinates: GPXParser.Coordinates = try? attributes.decode(),
                  let coordinates2D = coordinates.toCLLocationCoordinate2D else {
                return nil
            }

            self.coordinates = coordinates2D
        }
    }
}

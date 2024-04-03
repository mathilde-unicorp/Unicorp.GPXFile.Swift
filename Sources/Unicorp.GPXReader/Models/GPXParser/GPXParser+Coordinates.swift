//
//  GPXParser+Coordinates.swift
//
//
//  Created by Ressier Mathilde on 03/04/2024.
//

import Foundation
import MapKit

extension GPXParser {

    struct Coordinates: Codable {
        let latitude: String
        let longitude: String

        enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "lon"
        }
    }

}

extension GPXParser.Coordinates {
    var toCLLocationCoordinate2D: CLLocationCoordinate2D? {
        guard let latitude = Double(self.latitude),
              let longitude = Double(self.longitude) else { return nil }

        return CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}

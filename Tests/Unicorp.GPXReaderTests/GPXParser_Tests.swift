//
//  GPXParser_Tests.swift
//  
//
//  Created by Ressier Mathilde on 02/04/2024.
//

import XCTest
import Unicorp_GPXReader

final class GPXParser_Tests: XCTestCase {

    func testGPXPaser() throws {
        let filename = "gr66"
        
        guard let fileURL = Bundle.module.url(forResource: filename, withExtension: "gpx") else {
            print("Cannot get file with filename \(filename)")
            return
        }

        let parser = GPXParser()
        let result = parser.parse(gpxFileURL: fileURL)

        print(result)
        XCTAssertNotNil(result)
    }
}

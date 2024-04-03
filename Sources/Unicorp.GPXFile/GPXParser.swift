//
//  GPXParser.swift
//
//
//  Created by Ressier Mathilde on 02/04/2024.
//

import Foundation
import MapKit

enum GPXParserError: Error {
    case invalidUrl
}

public class GPXParser: NSObject {
    // will be assigned in the init together with the data from the gpx file
    private var xmlParser: XMLParser?

    // temp variable to store the chars fired by the parser
    private var xmlText: String = ""
    // instantiating an empty data model
    private var gpxData: GPXData = GPXData()

    // -------------------------------------------------------------------------
    // MARK: - Parse Method
    // -------------------------------------------------------------------------

    //This is not a delegate function. We call it from outside to get our gpxData parsed
    // We init with a gpx file in our bundle in this case but it could be on the web as well
    public func parse(gpxFileURL: URL) throws -> GPXData? {
        guard let data = try? Data(contentsOf: gpxFileURL) else {
            print("Cannot get data from file \(gpxFileURL)")
            throw GPXParserError.invalidUrl
        }

        return parse(data: data)
    }

    public func parse(data: Data) -> GPXData {
        xmlParser = XMLParser(data: data)
        xmlParser?.delegate = self
        xmlParser?.parse()

        return gpxData
    }
}

extension GPXParser: XMLParserDelegate {
    // delegate function didStartElement
    // it will notify me when the element tag is found as a start. I will use it for the latitude and longitude params
    public func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String]
    ) {
        // reset temp text to be empty
        xmlText = ""

        print("-----------------------------------")
        print(attributeDict)
        
        guard let key = GPXData.GPXKeys(rawValue: elementName) else { return }

        // in this method we will only look at two elements and get their coordinates
        switch key {
        case .trackpoint:
            // from the XMLParser we get strings
            if let trackpoint = GPXData.Trackpoint(attributes: attributeDict) {
                gpxData.trackpoints.append(trackpoint)
            }
        case .waypoint:
            if let waypoint = GPXData.Waypoint(attributes: attributeDict) {
                gpxData.waypoints.append(waypoint)
            }
        default:
            return
        }
    }

    // this is another parser method we get from the delegate. 
    // This one fires when we get a closing tag for an element.
    // Ideal to get the values from the header.
    // When we get at the end of the tag our temp xmltext var will be populated with the string inside the tags
    public func parser(_ parser: XMLParser,
                didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?) {
        let cleanXmlText = xmlText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard let key = GPXData.GPXKeys(rawValue: elementName) else { return }
        
        // these are from the XML header
        switch key {
        case .author:
            gpxData.author = cleanXmlText
        case .url:
            gpxData.url = cleanXmlText
        case .time:
            gpxData.time = ISO8601DateFormatter().date(from: cleanXmlText)
        case .name:
            gpxData.name = cleanXmlText
        default: break
        }
    }
    // this delegate method populates our temp file xmlText
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        xmlText += string
    }

}

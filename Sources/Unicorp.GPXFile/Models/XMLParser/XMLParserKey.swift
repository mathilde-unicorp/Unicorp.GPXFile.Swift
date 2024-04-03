//
//  XMLParserKey.swift
//  
//
//  Created by Ressier Mathilde on 03/04/2024.
//

import Foundation

protocol XMLParserKey: Decodable {
    static var key: String { get }
}

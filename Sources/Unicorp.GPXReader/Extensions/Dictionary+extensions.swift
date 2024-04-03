//
//  Dictionary+extensions.swift
//
//
//  Created by Ressier Mathilde on 03/04/2024.
//

import Foundation

extension Dictionary {
    func decode<T: Decodable>() throws -> T {
        let data = try JSONSerialization.data(withJSONObject: self)
        let decoded = try JSONDecoder().decode(T.self, from: data)

        return decoded
    }
}

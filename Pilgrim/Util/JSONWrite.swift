//
//  JSONWrite.swift
//  Pilgrim
//
//  Created by Paulo Henrique Gomes da Silva on 21/06/23.
//

import Foundation

class JSONWrite {
    static func encodeObject<T: Codable>(_ object: [T]) -> Data {
        do {
            let encode = JSONEncoder()
            encode.outputFormatting = .prettyPrinted
            let encodedData = try encode.encode(object)
            return encodedData
        } catch {
            print("A operação resultou no seguinte erro:\n \(error)")
            return Data()
        }
    }
}

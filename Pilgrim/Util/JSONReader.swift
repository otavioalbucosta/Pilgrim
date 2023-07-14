//
//  JSONReader.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import Foundation

class ReadJson {

    static let instance = ReadJson()

    func loadjson() -> [LocalElement] {
        if let url = Bundle.main.url(forResource: "LocalsJSON", withExtension: "json") {

            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData: [LocalElement] =  try decoder.decode([LocalElement].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }

        return [LocalElement(region: .nordeste, state: .ce, local: "", imageURL: nil, localDescription: nil)]
    }
}

//
//  LocalModel.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import Foundation

struct LocalElement: Codable, Hashable {
    let region: Region
    let state: String
    let local: String?
    let imageURL: String?
    let localDescription: String?
}

enum Region: String, Codable {
    case centroOeste = "Centro-Oeste"
    case nordeste = "Nordeste"
    case norte = "Norte"
    case sul = "Sul"
    case sudest = "Sudeste"
}

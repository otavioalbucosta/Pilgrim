//
//  LocalModel.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import Foundation

struct LocalElement: Codable, Hashable {
    let region: Region
    let state: States
    let local: String?
    let imageURL: String?
    let localDescription: String?

    var correct: Bool = true

    enum CodingKeys: CodingKey {
        case region
        case state
        case local
        case imageURL
        case localDescription
    }
}

enum Region: String, Codable {
    case centroOeste = "Centro-Oeste"
    case nordeste = "Nordeste"
    case norte = "Norte"
    case sul = "Sul"
    case sudest = "Sudeste"
}

enum States: String, Codable {
    case am = "AM"
    case ac = "AC"
    case pa = "PA"
    case rr = "RR"
    case ro = "RO"
    case ap = "AP"
    case to = "TO"
    case mg = "MG"
    case sp = "SP"
    case es = "ES"
    case rj = "RJ"
    case go = "GO"
    case df = "DF"
    case mt = "MT"
    case ms = "MS"
    case rs = "RS"
    case sc = "SC"
    case pr = "PR"
    case al = "AL"
    case ba = "BA"
    case se = "SE"
    case pe = "PE"
    case pb = "PB"
    case rn = "RN"
    case pi = "PI"
    case ma = "MA"
    case ce = "CE"
}

// Fazer o Card utilizazndo modelos separados

//struct CardModel {
//    let localElement: LocalElement
//    var correct: Bool = true
//}

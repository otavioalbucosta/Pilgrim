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
    case am = "Amazonas"
    case ac = "Acre"
    case pa = "Pará"
    case rr = "Roraima"
    case ro = "Rondônia"
    case ap = "Amapá"
    case to = "Tocantins"
    case mg = "Minas Gerais"
    case sp = "São Paulo"
    case es = "Espírito Santo"
    case rj = "Rio de Janeiro"
    case go = "Goiás"
    case df = "Distrito Federal"
    case mt = "Mato Grosso"
    case ms = "Mato Grosso do Sul"
    case rs = "Rio Grande do Sul"
    case sc = "Santa Catarina"
    case pr = "Paraná"
    case al = "Alagoas"
    case ba = "Bahia"
    case se = "Sergipe"
    case pe = "Pernambuco"
    case pb = "Paraíba"
    case rn = "Rio Grande do Norte"
    case pi = "Piauí"
    case ma = "Maranhão"
    case ce = "Ceará"
}

// Fazer o Card utilizazndo modelos separados

//struct CardModel {
//    let localElement: LocalElement
//    var correct: Bool = true
//}

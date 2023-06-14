//
//  CardViewmodel.swift
//  Pilgrim
//
//  Created by Paulo Henrique Gomes da Silva on 14/06/23.
//

import Foundation

class TinderViewmodel: ObservableObject {
    @Published var locals: [LocalElement] = []
    @Published var localIndex = 0
    @Published var currentLocal: LocalElement = LocalElement(region: Region.nordeste, state: "", local: "", imageURL: "", localDescription: "")

    func fetchLocals() {
        let getLocals = ReadJson.instance.loadjson()
        locals = getLocals
        currentLocal = locals.first!
    }

    func passLocal() {
        if locals.count > 0 {
            localIndex += 1
            currentLocal = locals[localIndex]
        }
    }

    func returnLocal() {
        if locals.count > 0 {
            localIndex -= 1
            currentLocal = locals[localIndex]
        }
    }
}

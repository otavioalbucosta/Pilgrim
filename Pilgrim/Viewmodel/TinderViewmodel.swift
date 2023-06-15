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
    @Published var currentLocal: LocalElement = LocalElement(region: Region.nordeste, state: .ce, local: "", imageURL: "", localDescription: "")

    func fetchLocals() {
        let getLocals = ReadJson.instance.loadjson()
        locals = getLocals
        currentLocal = locals.first!
    }

    func getShuffleData() {
        let allCorrectCards = ReadJson.instance.loadjson().shuffled()
        let percentage = 0.5
        let wrongCardsAmount = Int(Double(allCorrectCards.count) * percentage)
        let cardsToMakeWrong = allCorrectCards.prefix(wrongCardsAmount)
        let correctCards = allCorrectCards.suffix(allCorrectCards.count - wrongCardsAmount)
        let wrongCards = cardsToMakeWrong.map {
            LocalElement(region: $0.region, state: AllStates.randomElement()!, local: $0.local, imageURL: $0.imageURL, localDescription: $0.localDescription, correct: false)
        }
        locals = (wrongCards + correctCards).shuffled()
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

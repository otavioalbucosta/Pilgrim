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
    @Published var cardsQueue: [LocalElement] = []
    @Published var isGameOver: Bool = false
    @Published var numberOfLifesRemains: Int = 3 {
        didSet {
            if numberOfLifesRemains == 0 {
                isGameOver = true
                print("Game Over")
            } else if numberOfLifesRemains < 0 {
                numberOfLifesRemains = 0
            }
        }
    }

    init() {
        getShuffleData()
    }

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
        cardsQueue = Array(locals.suffix(3))
        localIndex = locals.count - 3
        currentLocal = locals.first!
    }

    func popCard(_ direction: DragDirection) {
        cardsQueue.removeFirst()
        if localIndex >= 0 {
            cardsQueue.append(locals[localIndex])
            localIndex -= 1
        }
        switch direction {
        case .right:
            if cardsQueue.first?.correct == true {
                print("ACERTOU!")
            } else {
                loseLife()
                print("ERROU, VIDAS RESTANTES: \(numberOfLifesRemains)")
            }
        case .left:
            if cardsQueue.first?.correct == false {
                print("ACERTOU!")
            } else {
                loseLife()
                print("ERROU, VIDAS RESTANTES: \(numberOfLifesRemains)")
            }
        }
    }

    func loseLife() {
        numberOfLifesRemains -= 1
    }
}

enum DragDirection {
    case right
    case left
}

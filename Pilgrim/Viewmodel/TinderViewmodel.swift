//
//  CardViewmodel.swift
//  Pilgrim
//
//  Created by Paulo Henrique Gomes da Silva on 14/06/23.
//

import Foundation

class TinderViewmodel: ObservableObject {

    @Published var cardsQueue: [LocalElement] = []

    @Published var locals: [LocalElement] = []
    @Published var localIndex = 0
    @Published var currentLocal: LocalElement = LocalElement(region: Region.nordeste, state: .ce, local: "", imageURL: "", localDescription: "")
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
    var correctLocals: [LocalElement] = []

    // TODO: Realizar a persistência dos dados utilizando UserDefaults e para as imagens utilizar FileManager.

    init() {
        getShuffleData()
    }

    func getShuffleData() {
        let allCorrectCards = ReadJson.instance.loadjson().shuffled()
        let percentage = 0.5
        let wrongCardsAmount = Int(Double(allCorrectCards.count) * percentage)
        let cardsToMakeWrong = allCorrectCards.prefix(wrongCardsAmount)
        let correctCards = allCorrectCards.suffix(allCorrectCards.count - wrongCardsAmount)
        let wrongCards = cardsToMakeWrong.map {
            let randomState = AllStates.randomElement()!
            return LocalElement(region: $0.region, state: randomState, local: $0.local, imageURL: $0.imageURL, localDescription: $0.localDescription, correct: randomState == $0.state)
        }
        locals = (wrongCards + correctCards).shuffled()
        cardsQueue = Array(locals.suffix(3))
        localIndex = locals.count - 3
        currentLocal = locals.first!
    }

    func popCard(_ direction: DragDirection) {
        switch direction {
        case .right:
            if cardsQueue.first?.correct == true {
                print("ACERTOU!")
                SoundManager.instance.playSound(name: "feedBackPositivo")
                HapticManager.instance.successFeedback()
                correctLocals.append(cardsQueue.first!)
                let localsData = JSONWrite.encodeObject(correctLocals)
                UserDefaults.standard.set(localsData, forKey: "correctLocals")
            } else {
                print("ERROU, VIDAS RESTANTES: \(numberOfLifesRemains)")
                SoundManager.instance.playSound(name: "feedBackNegativo")
                HapticManager.instance.errorFeedback()
                loseLife()
            }
        case .left:
            if cardsQueue.first?.correct == false {
                print("ACERTOU!")
                SoundManager.instance.playSound(name: "feedBackPositivo")
                HapticManager.instance.successFeedback()
                correctLocals.append(cardsQueue.first!)
                let localsData = JSONWrite.encodeObject(correctLocals)
                UserDefaults.standard.set(localsData, forKey: "correctLocals")
            } else {
                print("ERROU, VIDAS RESTANTES: \(numberOfLifesRemains)")
                SoundManager.instance.playSound(name: "feedBackNegativo")
                HapticManager.instance.errorFeedback()
                loseLife()
            }
        }

        cardsQueue.removeFirst()

        if localIndex >= 0 {
            cardsQueue.append(locals[localIndex])
            localIndex -= 1
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

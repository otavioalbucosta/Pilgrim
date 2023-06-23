//
//  CardViewmodel.swift
//  Pilgrim
//
//  Created by Paulo Henrique Gomes da Silva on 14/06/23.
//

import Foundation

class TinderViewmodel: ObservableObject {
    
    let gameCenterViewController = GameCenterViewController()
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
    @Published var score: Int = 0

    var highScore: Int = 0
    var correctLocals: [LocalElement] = []

    // TODO: Realizar a persistência dos dados utilizando UserDefaults e para as imagens utilizar FileManager.

    init() {
        getShuffleData()
        let correctData = UserDefaults.standard.data(forKey: "correctLocal")
        let highScoreInteger = UserDefaults.standard.integer(forKey: "highScore")
        let decoder = JSONDecoder()
        if correctData != nil {
            do {
                let decodedData = try decoder.decode([LocalElement].self, from: correctData!)
                correctLocals = decodedData
            } catch {
                print(error)
            }
        }
        highScore = highScoreInteger
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
                if !correctLocals.contains(cardsQueue.first!){
                    correctLocals.append(cardsQueue.first!)
                }
                let localsData = JSONWrite.encodeObject(correctLocals)
                UserDefaults.standard.set(localsData, forKey: "correctLocal")
                scoreIncrease()

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
                if !correctLocals.contains(cardsQueue.first!){
                    correctLocals.append(cardsQueue.first!)
                }
                let localsData = JSONWrite.encodeObject(correctLocals)
                UserDefaults.standard.set(localsData, forKey: "correctLocal")
                scoreIncrease()
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
        compareHighScore(score)
    }

    func loseLife() {
        numberOfLifesRemains -= 1
    }

    func resetGame() {
        numberOfLifesRemains = 3
        isGameOver = false
        getShuffleData()
        score = 0
        
    }

    private func scoreIncrease() {
        score += 1
    }

    private func compareHighScore(_ currentScore: Int) {
        if currentScore > highScore {
            UserDefaults.standard.set(currentScore, forKey: "highScore")
            highScore = score
            gameCenterViewController.saveGameCenterLeaderboard(record: highScore)
        }
    }
}

enum DragDirection {
    case right
    case left
}

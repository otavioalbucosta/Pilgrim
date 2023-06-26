//
//  FeedViewModel.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 16/06/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var cardsToFeed = [LocalElement]()
    @Published var remainingUnkownCards = [LocalElement]()

    init() {
        recvCorrectCards()
    }
    
    func recvCorrectCards() {
        self.cardsToFeed = []
        self.remainingUnkownCards = []
        let cards = loadCorrectLocal()
        
        if (cardsToFeed.count > 0) {

            for card in cardsToFeed {
                cardsToFeed.append(card)
            }
        } else {
            self.cardsToFeed = cards
        }
        
        let allCards = ReadJson.instance.loadjson().filter { element in
            return !cardsToFeed.contains(where: {$0.local == element.local})
        }
        remainingUnkownCards = allCards
        
        

    }
    

    func loadCorrectLocal() -> [LocalElement] {
        do {
            guard let localData = UserDefaults.standard.data(forKey: "correctLocal") else {
//                return LocalElement(region: .nordeste, state: .ce, local: "", imageURL: "", localDescription: "")
                return []
            }
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([LocalElement].self, from: localData)
            return decodedData
        } catch {
            print(error)
//            return LocalElement(region: .nordeste, state: .ce, local: "", imageURL: "", localDescription: "")
            return []
        }
    }
    
    
    func fetchCorrectCards() -> [LocalElement] {
//        return self.mock
        return []
    }
    
    #if DEBUG
    @Published var mock = [LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia 1", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."),LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Giaca", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."),LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia 2", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."),LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia 3", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."),LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."),LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia 4", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."),LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."),LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique.")
        ]
    #endif
}

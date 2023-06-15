//
//  TinderView.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import SwiftUI

struct TinderView: View {

    @State var mockModels: [LocalElement] = []
    @State var visualMockModels: [LocalElement] = []

    var body: some View {
        ZStack {
            HStack {
                SemiCircle()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.red)
                    .opacity(0.7)
                    .offset(CGSize(width: -10, height: 0))
                Spacer()
                SemiCircle()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.green)
                    .rotationEffect(.degrees(180))
                    .opacity(0.7)
                    .offset(CGSize(width: 10, height: 0))
            }

            ForEach(mockModels.reversed(), id: \.hashValue) { model in
                CardView(localName: model.local ?? "Ainda nao adicioando", localEstado: model.state.rawValue, url: URL(string: model.imageURL ?? "https://images.hdqwalls.com/download/kerry-park-seattle-united-states-5k-gu-1080x1920.jpg ")) {
                    print(model.correct ? "Acertou" : "Errou")
                } wrongChoice: {
                    print(model.correct ? "Errou" : "Acertou")
                }
            }

        }
        .onAppear {
            let allCorrectCards = ReadJson.instance.loadjson().shuffled()
            let percentage = 0.5
            let wrongCardsAmount = Int(Double(allCorrectCards.count) * percentage)
            let cardsToMakeWrong = allCorrectCards.prefix(wrongCardsAmount)
            let correctCards = allCorrectCards.suffix(allCorrectCards.count - wrongCardsAmount)
            let wrongCards = cardsToMakeWrong.map {
                LocalElement(region: $0.region, state: AllStates.randomElement()!, local: $0.local, imageURL: $0.imageURL, localDescription: $0.localDescription, correct: false)
            }
            mockModels = (wrongCards + correctCards).shuffled()
        }
    }
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView()
    }
}

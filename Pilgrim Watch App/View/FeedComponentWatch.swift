//
//  FeedComponentWatch.swift
//  Pilgrim Watch App
//
//  Created by Paulo Henrique Gomes da Silva on 26/06/23.
//

import SwiftUI
import Kingfisher

struct FeedComponentWatch: View {
    var card: LocalElement

    var body: some View {
            ZStack(alignment:.bottom) {
                KFImage(source: .network(URL(string: card.imageURL!)!))
                    .resizable()
                    .frame(width: 150, height: 130)
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 150, height: 30)
                        .opacity(0.7)
                    Text(card.local)
                        .foregroundColor(.black)
                }
            }
    }
}

struct FeedComponentWatch_Previews: PreviewProvider {
    static var previews: some View {
        FeedComponentWatch(card: LocalElement(region: .nordeste, state: .ce, local: "teste", imageURL: "https://upload.wikimedia.org/wikipedia/commons/8/89/Pedra_da_Galinha_Choca_-_panoramio.jpg", localDescription: "testando"))
    }
}

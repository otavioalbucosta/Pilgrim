//
//  FeedWatchView.swift
//  Pilgrim Watch App
//
//  Created by Paulo Henrique Gomes da Silva on 23/06/23.
//

import SwiftUI

struct FeedWatchView: View {
    @ObservedObject var wcSessionManager = WCSessionManager.shared

    var body: some View {
        if wcSessionManager.cards.isEmpty {
            Text("Nenhum card foi desbloqueado")
        } else {
            ScrollView {
                LazyVGrid(columns: [GridItem()]) {
                    ForEach(wcSessionManager.cards, id: \.self) { card in
                        FeedComponentWatch(card: card)
                    }
                }
            }
        }
    }
}

struct FeedWatchView_Previews: PreviewProvider {
    static var previews: some View {
        FeedWatchView()
    }
}

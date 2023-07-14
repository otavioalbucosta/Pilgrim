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
        Text("teste")
        Button {
            print(wcSessionManager.cards)
        } label: {
            Text("Atualizar cards")
        }
    }
}

struct FeedWatchView_Previews: PreviewProvider {
    static var previews: some View {
        FeedWatchView()
    }
}

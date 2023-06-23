//
//  FeedView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 16/06/23.
//

import SwiftUI

struct FeedView: View {
    let gameCenterView = GameCenterViewController()
    @StateObject var viewmodel = FeedViewModel()
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    ForEach(viewmodel.cardsToFeed, id: \.self) { element in
                        NavigationLink {
                            FeedDetailsView(local: element)
                        } label: {
                            FeedComponentView(local: element)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }.onAppear{
            gameCenterView.authenticateUser()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

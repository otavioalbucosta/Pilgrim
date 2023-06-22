//
//  FeedView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 16/06/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewmodel = FeedViewModel()
    var body: some View {
        NavigationStack{
            ScrollView {
                
                VStack(alignment: .leading){
                    Text("The Pilgrims")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 0))
                    Text("Locais Descobertos")
                        .font(.title3)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 0))
//                    VStack{
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 10){
                        ForEach(Array(viewmodel.cardsToFeed.enumerated()), id: \.offset) { (_, element) in
                            NavigationLink {
                                FeedDetailsView(local: element)
                            } label: {
                                FeedComponentView(isBlocked: false, local: element)
                            }
                            .buttonStyle(.plain)
                        }
                        ForEach(Array(viewmodel.remainingUnkownCards.enumerated()), id: \.offset) { (_, element) in
                            NavigationLink {
                                FeedDetailsView(local: element)
                            } label: {
                                FeedComponentView(isBlocked: true, local: element)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewmodel.recvCorrectCards()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

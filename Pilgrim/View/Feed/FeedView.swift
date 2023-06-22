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
                VStack{
                    if viewmodel.cardsToFeed.isEmpty{
                        Spacer()
                        Text("Você não possui cartas acertadas ainda :( ")
                        Text("Jogue mais o Jogo para desbloquear cartas acertadas")
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
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
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

//
//  FeedView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 16/06/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewmodel = FeedViewModel()
    @State var searchText = ""
    
    @State var feedCards = [LocalElement]()
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                
                VStack(alignment: .leading){

//                    VStack{
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 30){
                        ForEach((feedCards), id: \.self) {  element in
                            if viewmodel.cardsToFeed.contains(element) {
                                NavigationLink {
                                    FeedDetailsView(local: element)
                                } label: {
                                    FeedComponentView(isBlocked: false, local: element)
                                }
                                .buttonStyle(.plain)
                            }else{
                                FeedComponentView(isBlocked: true, local: element)
                            }

                        }
                    }
                    .navigationTitle("Locais Descobertos")
                    .navigationBarTitleDisplayMode(.large)
                    .listStyle(.plain)
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    .onChange(of: searchText) { newValue in
                        search()
                    }
                }
            }
        }
        .onAppear {
            viewmodel.recvCorrectCards()
            feedCards = viewmodel.cardsToFeed + viewmodel.remainingUnkownCards
        }
    }
    
    func search() {
        if searchText.isEmpty {
            feedCards = viewmodel.cardsToFeed + viewmodel.remainingUnkownCards
            
            
        }else {
            feedCards = feedCards.filter({ element in
                return element.local.localizedCaseInsensitiveContains(searchText)
            })
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

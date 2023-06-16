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
        ScrollView {
            VStack {
                ForEach(viewmodel.cardsToFeed, id: \.self) { element in
                    FeedComponentView(placeDescription: element.localDescription!, placeTitle: element.local!, placeLocation: element.region)
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

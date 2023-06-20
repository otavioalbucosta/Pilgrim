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
                    ForEach(viewmodel.mock, id: \.self) { element in
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

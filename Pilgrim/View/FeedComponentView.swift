//
//  SwiftUIView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 16/06/23.
//

import SwiftUI

struct FeedComponentView: View {
    var imageURL: URL?
    var placeDescription: String
    var placeTitle: String
    var placeLocation: Region
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .leading, spacing: 1) {
                Text("Estado - Local")
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 390, height: 300)
                Text("LOREM IPSUM DOLOR SIT AMET")
            }
        }
        

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedComponentView(placeDescription: "OI", placeTitle: "Linda", placeLocation: Region.norte)
    }
}

//
//  SwiftUIView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 16/06/23.
//

import SwiftUI

struct FeedComponentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text("Estado - Local")
            RoundedRectangle(cornerRadius: 25)
            Text("LOREM IPSUM DOLOR SIT AMET")
        }

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedComponentView()
    }
}

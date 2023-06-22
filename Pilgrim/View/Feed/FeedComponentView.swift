//
//  SwiftUIView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 16/06/23.
//

import SwiftUI
import Kingfisher

struct FeedComponentView: View {
    @State var isExpanded: Bool = false
//    var imageURL: URL?
//    var placeDescription: String
//    var placeTitle: String
//    var placeLocation: Region
    @State var isBlocked: Bool
    var local: LocalElement
    var body: some View {
        if isBlocked {
            ZStack() {
                KFImage(URL(string:local.imageURL!))
                    .resizable()
                    .frame(width: 155,height: 155)
                    .cornerRadius(25)
                    .blur(radius: 3)
                    .foregroundColor(.black)
                    .opacity(0.5)

                Image(systemName: "lock.fill")
                    .font(.title)
            }
        }else {
            VStack(alignment: .leading, spacing: 1) {
                KFImage(URL(string:local.imageURL!))
                    .resizable()
                    .frame(width: 155,height: 155)
                    .cornerRadius(25)
            }
        }

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedComponentView(isBlocked: true, local: LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."))
    }
}

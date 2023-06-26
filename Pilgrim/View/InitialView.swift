//
//  NavigationView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 16/06/23.
//

import SwiftUI

struct InitialView: View {
    @State var selection: Int = 2
    var body: some View {
        TabView(selection: $selection) {
            FeedView()
                .tabItem {
                    Label {
                        Text("Feed")
                    } icon: {
                        Image(systemName: "house.fill")
                    }
                }
            TinderView()
                .tabItem {
                    Label {
                        Text("Game")
                    } icon: {
                        Image(systemName: "gamecontroller.fill")
                    }

                }
        }

    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

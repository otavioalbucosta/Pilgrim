//
//  ContentView.swift
//  Pilgrim Watch App
//
//  Created by Luiz Sena on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            FeedWatchView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

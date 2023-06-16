//
//  PilgrimApp.swift
//  Pilgrim Watch App
//
//  Created by Luiz Sena on 14/06/23.
//

import SwiftUI

@main
struct Pilgrim_Watch_AppApp: App {
    @State var mockModels: [LocalElement] = []
    @State var visualMockModels: [LocalElement] = []



    var body: some Scene {
        WindowGroup {
            ZStack {
                ForEach(mockModels, id: \.self) { model in
                    ContentView {
                        mockModels.popLast()
                        print("ADD")
                        print(model.region)
                    } remove: {
                        mockModels.popLast()
                        print("REMOVED")
                        print(model.region)
                    }
                }
            }
            .onAppear {
                mockModels = ReadJson.instance.loadjson()
                print(mockModels)
            }
        }
    }
}

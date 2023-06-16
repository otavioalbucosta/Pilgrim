//
//  ContentView.swift
//  Pilgrim Watch App
//
//  Created by Luiz Sena on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    
    var add: () -> Void = {}
    var remove: () -> Void = {}
    @State private var offset: CGSize = CGSize(width: 0, height: 0)
    @State var contentColor: Color = .white
    @State var digitalCrownValue: Double = 0.0

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(contentColor)
                .frame(width: 150, height: 100)
                .offset(offset)
                .rotationEffect(.degrees(Double(offset.width / 40)))
        }
        .focusable()
        .digitalCrownRotation(detent: $digitalCrownValue, from: -51, through: 51, by: 1, sensitivity: .medium, isContinuous: true) { _ in
            print(digitalCrownValue)
            offset = CGSize(width: digitalCrownValue, height: 0)
            swaipeCard(width: digitalCrownValue)
        }
    }

    func swaipeCard(width: Double) {
        switch Int(width) {
        case 50:
            offset = CGSize(width: 500, height: 0)
            add()
            digitalCrownValue = 0.0
        case -50:
            offset = CGSize(width:  -500, height: 0)
            remove()
            digitalCrownValue = 0.0
        default:
            print("DEFAULT")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

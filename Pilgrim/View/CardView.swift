//
//  ContentView.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import SwiftUI

struct CardView: View {

    @State private var cardColor: Color = .primary
    @State private var offset: CGSize = CGSize(width: 0, height: 0)
    @State var localName: String
    @State var localEstado: String
    var url: URL?
    var correctChoice: () -> Void = {}
    var wrongChoice: () -> Void = {}

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(cardColor)
                .frame(width: 280, height: 400)
                .overlay(
                    VStack {
                        AsyncImage(url: url) { phase in
                            phase.image?
                                .resizable()
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 5)
                        }
                        .frame(width: 220, height: 300)

                        Text(localEstado)
                            .font(.title)
                            .foregroundColor(.purple)

                        Text(localName)
                            .font(.title)
                            .foregroundColor(.purple)
                    }
                )
                .offset(offset)
                .rotationEffect(.degrees(Double(offset.width / 40)))
                .gesture(
                    DragGesture()
                        .onChanged{ gesture in
                            offset = gesture.translation
                            withAnimation {
                                changeColor(width: offset.width)
                            }
                        }
                        .onEnded { _ in
                            withAnimation {
                                swipeCard(width: offset.width)
                                changeColor(width: offset.width)
                            }
                        }
                )
        }
    }

    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
            cardColor = .red
            wrongChoice()
        case 150...500:
            offset = CGSize(width: 500, height: 0)
            cardColor = .green
            correctChoice()
        default:
            offset = .zero
        }
    }

    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-100):
            cardColor = .red
        case 100...500:
            cardColor = .green
        default:
            cardColor = .primary
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(localName: "Imagem", localEstado: "CE")
    }
}

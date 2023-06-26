//
//  ContentView.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import SwiftUI
import Kingfisher

struct CardView: View {

    @State private var cardColor: Color = .clear
    @State private var offset: CGSize = .zero
    var localName: String
    var localEstado: String
    var url: URL?
    var correctChoice: () -> Void = {}
    var wrongChoice: () -> Void = {}

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 280, height: 400)
                .overlay(
                    ZStack {
                        KFImage(source: .network(url!))
                            .resizable()
                            .cornerRadius(25)
                            .frame(width: 280, height: 440)
                            .scaledToFit()
                            .shadow(radius: 2)
                        VStack {
                            HStack {
                                Text(localName)
                                    .font(.system(size: 25, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                                    .padding([.leading, .bottom], 15)
                                    .shadow(color: .black, radius: 2)
                                Spacer()
                            }
                            .padding(.top, 15)
                            Spacer()
                        }
                    }.overlay(
                        cardColor
                            .cornerRadius(25)
                            .opacity(0.5)
                    )
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
                            withAnimation(.easeIn) {
                                swipeCard(width: offset.width)
                                changeColor(width: offset.width)
                            }
                            changeColor(width: offset.width)
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
            offset = .zero
        case 150...500:
            offset = CGSize(width: 500, height: 0)
            cardColor = .green
            correctChoice()
            offset = .zero
        default:
            offset = .zero
        }
    }

    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-100):
            cardColor = .gray
        case 100...500:
            cardColor = .gray
        default:
            cardColor = .clear

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(localName: "Imagem", localEstado: "CE")
    }
}

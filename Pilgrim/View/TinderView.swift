//
//  TinderView.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import SwiftUI
import Kingfisher

struct TinderView: View {

    @StateObject var viewmodel = TinderViewmodel()


    var body: some View {
        ZStack {
            HStack {
                SemiCircle()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.red)
                    .opacity(0.7)
                    .offset(CGSize(width: -10, height: 0))
                    .overlay {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(.trailing)
                    }
                Spacer()
                SemiCircle()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.green)
                    .rotationEffect(.degrees(180))
                    .opacity(0.7)
                    .offset(CGSize(width: 10, height: 0))
                    .overlay {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
            }
            .padding(.top, 120)
            ForEach(viewmodel.cardsQueue.reversed(), id: \.self) { element in
                CardView(
                    localName: element.local ?? "Não Encontrado",
                    localEstado: element.state.rawValue,
                    url: URL(string: element.imageURL ?? "https://images.hdqwalls.com/download/kerry-park-seattle-united-states-5k-gu-1080x1920.jpg")
                ) {
                    viewmodel.popCard(.right)
                } wrongChoice: {
                    viewmodel.popCard(.left)
                }
            }.padding(.top, 120)

            VStack {

                // MARK: Vidas
                if !viewmodel.isGameOver {
                    HStack(spacing: 15) {
                        ForEach(0...viewmodel.numberOfLifesRemains-1, id: \.self) { life in
//                            Circle()
//                                .fill(.linearGradient(.init(colors: [.red, .pink]), startPoint: .top, endPoint: .bottom))
//                                .frame(width: 50)
//                                .padding(.top, 50)
                            Image("seloCoracao")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.top, 50)

                        }

                        Spacer()
                    }
                    .padding(.leading, 45)
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.thinMaterial)
                        .frame(width: 250, height: 40)
                        .overlay {
                            Text(viewmodel.cardsQueue.first?.state.rawValue ?? "Você viu todos os cards")
                                .font(.system(size: 20, weight: .medium, design: .default))
                        }
                        .padding(.top, 25)
                    Spacer()
                }

                // MARK: Tela de Game Over
                if viewmodel.isGameOver {
                    ZStack {
                        Rectangle()
                            .fill(.thinMaterial)
                            .ignoresSafeArea()
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 300, height: 450)
                            .overlay {
                                VStack(spacing: 15) {

                                    HStack {
                                        Spacer()
                                        Text("Você perdeu!")
                                            .colorInvert()
                                            .font(.system(size: 20, weight: .bold))
                                        Spacer()
                                    }

                                    VStack(alignment: .leading, spacing: 15) {
                                        Text("Total de acertos na partida: \(viewmodel.score)")
                                            .colorInvert()
                                        // MARK: ESSE RETANGULO É A LINHA, REVER ESSE CÓDIGO!
                                        Rectangle()
                                            .fill(.secondary)
                                            .frame(width: 280, height: 2)
                                        Text("Melhor pontuação: \(viewmodel.highScore)")
                                            .colorInvert()
                                    }
                                    .padding(.leading, 10)

                                    Button("Jogar Novamente") {
                                        withAnimation {
                                            viewmodel.resetGame()
                                        }
                                    }
                                    .buttonStyle(.borderedProminent)
                                    Spacer()
                                }
                                .padding(.top, 29)
                            }

                        VStack {
                            Spacer()
                            Image("Pilgrim")
                                .resizable()
                                .frame(width: 200, height: 250)
                                .animation(.linear(duration: 3), value: 10)
                                .padding(.top, 25)

                        }
                    }

                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            KFImage(URL(string: viewmodel.cardsQueue.first?.imageURL ?? "https://images.hdqwalls.com/download/kerry-park-seattle-united-states-5k-gu-1080x1920.jpg"))
                .resizable()
                .scaledToFill()
                .overlay {
                    Rectangle().fill(.ultraThinMaterial)
                }
                .ignoresSafeArea()
        }
    }
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView()
    }
}

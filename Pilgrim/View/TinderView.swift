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
                Spacer()
                SemiCircle()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.green)
                    .rotationEffect(.degrees(180))
                    .opacity(0.7)
                    .offset(CGSize(width: 10, height: 0))
            }
            ForEach(viewmodel.cardsQueue.reversed(), id: \.self) { element in
                CardView(
                    localName: element.local ?? "Não Encontrado",
                    localEstado: element.state.rawValue,
                    url: URL(string: element.imageURL ?? "https://images.hdqwalls.com/download/kerry-park-seattle-united-states-5k-gu-1080x1920.jpg")
                ) {
                    viewmodel.popCard()
                } wrongChoice: {
                    viewmodel.popCard()
                }
            }

            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 15)
                    .fill(.thinMaterial)
                    .frame(width: 250, height: 40)
                    .overlay {
                        Text(viewmodel.cardsQueue[0].state.rawValue)
                            .font(.system(size: 20, weight: .medium, design: .default))
                    }
                    .padding(.bottom, 80)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            KFImage(URL(string: viewmodel.cardsQueue[0].imageURL ?? "https://images.hdqwalls.com/download/kerry-park-seattle-united-states-5k-gu-1080x1920.jpg"))
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

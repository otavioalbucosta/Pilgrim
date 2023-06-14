//
//  TinderView.swift
//  Pilgrim
//
//  Created by Luiz Sena on 14/06/23.
//

import SwiftUI

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

//            ForEach(viewmodel.locals.reversed(), id: \.hashValue) { model in
//                CardView(localName: model.local ?? "Ainda nao adicioando", url: URL(string: model.imageURL ?? "https://images.hdqwalls.com/download/kerry-park-seattle-united-states-5k-gu-1080x1920.jpg "))
//            }
            CardView(
                localName: viewmodel.currentLocal.local ?? "Não Encontrado",
                url: URL(string: viewmodel.currentLocal.imageURL ?? "https://images.hdqwalls.com/download/kerry-park-seattle-united-states-5k-gu-1080x1920.jpg")
            ) {
                viewmodel.passLocal()
            } remove: {
                viewmodel.returnLocal()
            }

        }
        .onAppear {
            Task {
                viewmodel.fetchLocals()
            }
        }
    }
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView()
    }
}

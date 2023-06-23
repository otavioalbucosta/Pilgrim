//
//  FeedDetailsView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 19/06/23.
//

import SwiftUI
import Kingfisher

struct FeedDetailsView: View {
    var local: LocalElement
    @State var frontRotationDegree = 0.0
    @State var backRotationDegree = 90.0
    @State var toggleSpin = false
    
    func flipCard() {
        toggleSpin.toggle()
        if toggleSpin {
            withAnimation(.linear(duration: 0.3)) {
                backRotationDegree = 90
            }
            withAnimation(.linear(duration: 0.3).delay(0.3)) {
                frontRotationDegree = 0
            }
        } else {
            withAnimation(.linear(duration: 0.3)) {
                frontRotationDegree = -90
            }
            withAnimation(.linear(duration: 0.3).delay(0.3)) {
                backRotationDegree = 0
            }
        }
    }
    var body: some View {

        ZStack {
            ZStack{
                KFImage(URL(string: local.imageURL!))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350,height: 600)
                    .background(.black)
                    .cornerRadius(25)
                    .opacity(0.1)
                
                VStack(alignment: .leading){
                    Text(local.local)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text(local.region.rawValue)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                    Text(local.localDescription!)
                        .padding()
                }

            }
            .frame(width: 350,height: 600)
            .rotation3DEffect(.degrees(frontRotationDegree), axis: (0,1,0), perspective: 0.7)
            KFImage(URL(string: local.imageURL!))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 350,height: 600)
                                .cornerRadius(25)
                                .rotation3DEffect(.degrees(backRotationDegree), axis: (0,1,0), perspective: 0.7)
            
                                
        }
        .onTapGesture {
            flipCard()
        }
        

    }
}


struct FeedDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailsView(local: LocalElement(region: Region.nordeste, state: .ce, local: "Buraco da Gia", imageURL: "https://images.unsplash.com/photo-1550242706-96d714afe5f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80", localDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere lacinia tincidunt. Suspendisse posuere erat vel gravida dignissim. Pellentesque placerat turpis nulla. Mauris rutrum vel velit vel ornare. Donec interdum turpis sit amet dictum tincidunt. Mauris tempor tempor metus ac sagittis. Nunc porta magna a felis consequat, vitae sagittis sem tristique."))
    }
}

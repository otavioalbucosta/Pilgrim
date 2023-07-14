//
//  OnboardingPageView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 26/06/23.
//

import SwiftUI

struct FinalOnboardingPageView: View {
    @Binding var finalPage: Bool
    @State var idle = false
    var image: String
    var title: String
    var description: String

    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width * 0.4)

                Text(String(localized: String.LocalizationValue(title)))
                    .font(.system(size: geo.size.width * 0.08, weight: .heavy, design: .rounded))
                    .padding(.bottom,12)

                Text(String(localized: String.LocalizationValue(description)))
                    .font(.system(size: geo.size.width * 0.04 , weight: .light, design: .rounded))
                    .padding([.bottom, .leading, .trailing], 30)

                Button {
                    withAnimation {
                        finalPage.toggle()
                    }
                } label: {
                    Image("travelButton")
                        .resizable()
                        .frame(width: geo.size.width * 0.35, height: geo.size.width * 0.15)
                        .overlay {
                            Text("EMBARCAR")
                                .font(.system(size: geo.size.width * 0.05, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .shadow(radius: 5)
                        .scaleEffect(idle ? 1.05 : 1)
                        .animation(Animation.spring().repeatForever().delay(0.3), value: idle)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 27/255, green: 42/255, blue: 108/255))
            .onAppear {
                idle = true
            }
        }
    }
}

struct FinalOnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        FinalOnboardingPageView(finalPage: .constant(true), image: "Pilgrim", title: "Bem Vindo!", description: "LOREM IPSUM DOLOR SIT AMET ASKDJNASLJDN")
    }
}

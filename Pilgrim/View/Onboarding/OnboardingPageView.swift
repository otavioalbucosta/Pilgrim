//
//  OnboardingPageView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 26/06/23.
//

import SwiftUI

struct OnboardingPageView: View {
    var image: String
    var title: String
    var description: String
    var body: some View {
        
        GeometryReader { geo in
                VStack(alignment: .center) {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width * 0.45)

                    Text(String(localized: String.LocalizationValue(title)))
                        .font(.system(size: geo.size.width * 0.08,weight: .heavy, design: .rounded))
                        .padding(.bottom,12)

                    Text(String(localized: String.LocalizationValue(description)))
                        .font(.system(size: geo.size.width * 0.04, weight: .light, design: .rounded))
                        .padding([.bottom, .leading, .trailing], 30)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 27/255, green: 42/255, blue: 108/255))
                .background(.blue)
        }
        .background(.red)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(image: "Pilgrim", title: "Bem Vindo!", description: "LOREM IPSUM DOLOR SIT AMET ASKDJNASLJDN LOREM IPSUM DOLOR SIT AMET ASKDJNASLJDN LOREM IPSUM DOLOR SIT AMET ASKDJNASLJDN")
    }
}

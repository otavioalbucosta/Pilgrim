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
        
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            Text(title)
                .font(.system(size: 35,weight: .heavy, design: .rounded))
                .padding(.bottom,12)
            
            Text(description)
                .font(.system(size: 18, weight: .light, design: .rounded))
                .padding(.bottom, 30)
            
            
        }
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 27/255, green: 42/255, blue: 108/255))
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(image: "Pilgrim", title: "Bem Vindo!", description: "LOREM IPSUM DOLOR SIT AMET ASKDJNASLJDN")
    }
}

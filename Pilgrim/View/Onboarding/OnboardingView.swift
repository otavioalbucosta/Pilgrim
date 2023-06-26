//
//  OnboardingView.swift
//  Pilgrim
//
//  Created by Otávio Albuquerque on 26/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showsOnboarding: Bool
    
    var body: some View {
            ZStack {
                Color(red: 179/255, green: 190/255, blue: 217/255).ignoresSafeArea()
                TabView {
                    OnboardingPageView(image: "Pilgrim", title: "bem vindo", description: "intro")
                    OnboardingPageView(image: "GameOnboarding", title: "jogo", description: "jogodesc")
                    FinalOnboardingPageView(image: "FeedOnboarding", title: "feed", description: "feeddesc", finalPage: $showsOnboarding)
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        
        

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showsOnboarding: .constant(true))
    }
}

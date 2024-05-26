//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by 林佑淳 on 2024/5/24.
//

import SwiftUI

struct OnboardingView: View {
    
    var doneRequested: () -> ()
    
    var body: some View {
        TabView {
            
            ScaledImageView(name: "iOS Memes Swift")
                .tag(0)
            ScaledImageView(name: "iOS Memes Swift (1)")
                .tag(1)
            ScaledImageView(name: "ThirdParty")
                .tag(2)
            
            Button("Done") {
                doneRequested()
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black
            .ignoresSafeArea(.all))
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView(doneRequested: { })
//    }
//}


//
//  ScaledImageView.swift
//  CoordinatorProject
//
//  Created by 林佑淳 on 2024/5/24.
//

import SwiftUI

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name) 
            .resizable()
            .scaledToFit()
    }
}

//#Preview {
//    ScaledImageView()
//}

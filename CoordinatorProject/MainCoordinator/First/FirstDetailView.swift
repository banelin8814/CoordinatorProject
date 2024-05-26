//
//  FirstDetailView.swift
//  CoordinatorProject
//
//  Created by 林佑淳 on 2024/5/24.
//

import SwiftUI

struct FirstDetailView: View {
    //觀察者
    @ObservedObject var viewModel: FirstTabViewModel
    
    var body: some View {
        
        VStack {
            Text("First Detail")
            //使用者編輯後，改變ViewModel狀態
            TextField("name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
             
            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

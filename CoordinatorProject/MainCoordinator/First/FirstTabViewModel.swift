//
//  FirstTabViewModel.swift
//  CoordinatorProject
//
//  Created by 林佑淳 on 2024/5/24.
//

import Foundation

class FirstTabViewModel: ObservableObject {
    //對這些屬性的任何更改都會觸發通知給觀察它們的視圖。
    @Published var name: String = ""
    @Published var email: String = ""
    
}

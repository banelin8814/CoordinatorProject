//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by 林佑淳 on 2024/5/24.
//

import UIKit
import Combine

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    //是 Combine 框架中的一種發布者（Publisher），
    //它會持有一個預設值(false)，並在值改變時發出通知。
    var hasSeenOnboarding = CurrentValueSubject<Bool,Never>(false)
    
    //用於存儲訂閱（Subscription）的引用，
    //以便在適當的時候取消訂閱，避免記憶體洩漏，
    //當不再需要這些訂閱時,subscriptions 這個集合會被自動釋放。
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        setupOnboardingValue()
        
        hasSeenOnboarding
            .removeDuplicates() //連續一樣的就不執行，例如false, false / 0,0
            .sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator() // 1:實例化下一層coordinator
                mainCoordinator.start() // 2: 創建VC
                self?.childCoordinators = [mainCoordinator] // 3: 保持對childCoordinators的引用
                self?.window.rootViewController = mainCoordinator.rootViewController // 4: 設定VC 
                
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboadingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
            }
        }.store(in: &subscriptions)
    }
    
    func setupOnboardingValue() {
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        //將 value 發送給 hasSeenOnboarding 的 subscriber
        //每次應用程序啟動時獲取之前保存的 hasSeenOnboarding 狀態
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter({ $0 }) //只有hasSeenOnboarding是true才會往下走
            .sink { (value) in //訂閱發布者(hasSeenOnboarding)，並且在值發生改變的時候執行以下閉包
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscriptions) //ApplicationCoordinator的生命週期內保持訂閱的活動狀態，也就是說綁著這個binding
    }
}

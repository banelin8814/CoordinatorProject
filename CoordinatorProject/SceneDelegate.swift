//
//  SceneDelegate.swift
//  CoordinatorProject
//
//  Created by 林佑淳 on 2024/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordinator: ApplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            //window?.rootViewController = ViewController()
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            self.applicationCoordinator = applicationCoordinator
            
            window.makeKeyAndVisible()
        }
    }
}


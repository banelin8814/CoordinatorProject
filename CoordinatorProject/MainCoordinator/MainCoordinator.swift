//
//  MainCoordinator.swift
//  CoordinatorProject
//
//  Created by 林佑淳 on 2024/5/24.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var rootViewController = UITabBarController()
    
    var childCoordinator = [Coordinator]()
    
    init() {
        //設定UITabBarController外觀
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }
    
    func start() {
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start() //createViewController
        self.childCoordinator.append(firstCoordinator)
        let firstViewController = firstCoordinator.rootViewController
        setup(vc: firstViewController,
              title: "FirstTab",
              imageName: "paperplane",
              selectedImageName: "paperplane.fill")
        
        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        self.childCoordinator.append(secondCoordinator)
        let secondViewController = secondCoordinator.rootViewController
        setup(vc: secondViewController,
              title: "SecondTab",
              imageName: "paperplane",
              selectedImageName: "paperplane.fill")
        
        //set UITabBarController
        self.rootViewController.viewControllers = [firstCoordinator.rootViewController, secondCoordinator.rootViewController]
    }
    
    func setup(vc: UIViewController,title: String, imageName:String,selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}

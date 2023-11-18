//
//  AppCoordinator.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import UIKit
import NetworkTool
import Common

final class AppCoordinator {
    private let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func start(in window: UIWindow) {
        
        let joinNavigationController = UINavigationController()
        joinNavigationController.tabBarItem = .init(title: "加盟", image: .init(systemName: "house"), selectedImage: nil)
        let joinCoordinator = JoinCoordinator(dependencies: dependencies, navigationController: joinNavigationController)
        joinCoordinator.start()
        
        let mineNavigationController = UINavigationController(rootViewController: MineMainViewController())
        mineNavigationController.tabBarItem = .init(title: "我的", image: .init(systemName: "person"), selectedImage: nil)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            joinNavigationController,
            mineNavigationController
        ]
        
        window.rootViewController = tabBarController
    }
}

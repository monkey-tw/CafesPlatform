//
//  Application.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/17.
//

import UIKit
import NetworkTool

final class Application {
    
    func configureMainPage(in window: UIWindow) {
        let coordinator = AppCoordinator(dependencies: StandardAppDependencies())
        coordinator.start(in: window)
    }
}

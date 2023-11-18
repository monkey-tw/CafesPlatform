//
//  JoinCoordinator.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import UIKit

final class JoinCoordinator: JoinNavigator {
    private let dependencies: AppDependencies
    private let navigationController: UINavigationController
    
    init(dependencies: AppDependencies, navigationController: UINavigationController) {
        self.dependencies = dependencies
        self.navigationController = navigationController
    }
    
    func start() {
        let repository = StandardJoinRepository(apiClient: dependencies.apiClient)
        let useCase = StandardApplyJoinUseCase(repository: repository)
        let viewModel = JoinMainViewModel(useCase: useCase, navigator: self)
        let vc = JoinMainViewController(viewModel: viewModel)
        navigationController.viewControllers = [vc]
    }
    
    // MARK: - JoinNavigator
    func showJoinDetail(_ model: JoinResultModel) {
        let viewModel = JoinDetailViewModel(model: model)
        let vc = JoinDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}

//
//  MainTabBarFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import Foundation
import UIKit

@MainActor protocol MainTabBarFactoryProtocol {
    func makeMainTabBarViewController() -> MainTabBarViewController
    func makeDashboardViewController() -> DashboardViewController
}

final class MainTabBarFactory: MainTabBarFactoryProtocol {
    
    @MainActor func makeMainTabBarViewController() -> MainTabBarViewController {
        let viewController = MainTabBarViewController()
        let presenter: MainTabBarPresentationLogic = MainTabBarPresenter(viewController: viewController)
        let worker: MainTabBarWorkerLogic = MainTabBarWorker()
        let interactor = MainTabBarInteractor(presenter: presenter,
                                              worker: worker)
        
        let router = MainTabBarRouter()
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        router.dataStore = interactor
        
        let dashboardViewController = makeDashboardViewController()
        viewController.viewControllers = [dashboardViewController]
        return viewController
    }
    
    @MainActor func makeDashboardViewController() -> DashboardViewController {
        let icon = UIImage(named: TabbarItem.home.imageName)
        let destinationVC = DashboardFactory(dependencies: DependencyContainer.shared).makeDashboardViewController()
        destinationVC.tabBarItem = UITabBarItem(title: TabbarItem.home.title,
                                                image: icon,
                                                tag: TabbarItem.home.tag)
        return destinationVC
    }
}

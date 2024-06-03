//
//  MainTabBarFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import Foundation
import UIKit

@MainActor protocol MainTabBarFactoryProtocol {
    func makeMainTabBarViewController() -> MainTabBarViewController
    func makeDashboardViewController() -> DashboardViewController
}

protocol MainTabBarServiceFactory {}

class MainTabBarFactory: MainTabBarFactoryProtocol {
    
    @MainActor func makeMainTabBarViewController() -> MainTabBarViewController {
        let viewController = MainTabBarViewController()
        let interactor = MainTabBarInteractor()
        let presenter = MainTabBarPresenter()
        let router = MainTabBarRouter()
        let worker = MainTabBarWorker()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        router.factory = self
        
        let dashboardViewController = makeDashboardViewController()
        let settingViewController = makeSettingViewController()
        viewController.viewControllers = [dashboardViewController, settingViewController]
        return viewController
    }
    
    @MainActor func makeDashboardViewController() -> DashboardViewController {
        let destinationVC = DashboardFactory().makeDashboardViewController()
        destinationVC.tabBarItem = UITabBarItem(title: "Home",
                                                image: UIImage(systemName: "house.fill"),
                                                tag: 0)
        return destinationVC
    }
    
    @MainActor func makeSettingViewController() -> SettingViewController {
        let destinationVC = SettingFactory().makeSettingViewController()
        destinationVC.tabBarItem = UITabBarItem(title: "Setting",
                                                image: UIImage(systemName: "slider.vertical.3"),
                                                tag: 1)
        return destinationVC
    }
}

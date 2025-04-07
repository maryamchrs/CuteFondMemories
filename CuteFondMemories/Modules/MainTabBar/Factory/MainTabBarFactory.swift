//
//  MainTabBarFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import Foundation
import UIKit

protocol MainTabBarFactoryProtocol {
     @MainActor func makeMainTabBarViewController() -> MainTabBarViewController
}

final class MainTabBarFactory: MainTabBarFactoryProtocol {
    
    // MARK: - Life cycle
    init(dependencies: DependencyContainerProtocol) {
        logger = dependencies.logger
        logger.logInit(String(describing: type(of: self)))
    }
    
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }

    // MARK: - Properties
    private(set) var logger: DefaultLoggerProtocol
    private(set) weak var interactor: MainTabBarBusinessLogic?
    private(set) weak var presenter: MainTabBarPresentationLogic?
    private(set) weak var worker: MainTabBarWorkerLogic?
    private(set) weak var router: MainTabBarRoutingLogic?
}

extension MainTabBarFactory {
    @MainActor func makeMainTabBarViewController() -> MainTabBarViewController {
        let viewController = MainTabBarViewController()
        let interactor = getInteractor()
        let presenter = getPresenter()
        _ = getWorker()
        let router = getRouter()
        
        configure(
            viewController: viewController,
            interactor: interactor,
            presenter: presenter,
            router: router
        )
        
        let dashboardViewController = makeDashboardViewController()
        viewController.viewControllers = [dashboardViewController]
        return viewController
    }
}

private extension MainTabBarFactory {
    
    @MainActor func makeDashboardViewController() -> DashboardViewController {
        let icon = UIImage(named: TabbarItem.home.imageName)
        let destinationVC = DashboardFactory(
            dependencies: DependencyContainer.shared
        ).makeDashboardViewController()
        destinationVC.tabBarItem = UITabBarItem(title: TabbarItem.home.title,
                                                image: icon,
                                                tag: TabbarItem.home.tag)
        return destinationVC
    }
    
    func getInteractor() -> MainTabBarBusinessLogic {
        guard let interactor = self.interactor else {
            let interactor = MainTabBarInteractor(presenter: getPresenter(),
                                                  worker: getWorker())
            self.interactor = interactor
            return interactor
        }
        return interactor
    }
    
    func getPresenter() -> MainTabBarPresentationLogic {
        guard let presenter = self.presenter else {
            let presenter = MainTabBarPresenter()
            self.presenter = presenter
            return presenter
        }
        return presenter
    }
    
    func getWorker() -> MainTabBarWorkerLogic {
        guard let worker = self.worker else {
            let worker = MainTabBarWorker()
            self.worker = worker
            return worker
        }
        return worker
    }
    
    func getRouter() -> MainTabBarRoutingLogic {
        guard let router = self.router else {
            let router = MainTabBarRouter()
            self.router = router
            return router
        }
        return router
    }
    
    @MainActor func configure(
           viewController: MainTabBarViewController,
           interactor: MainTabBarBusinessLogic,
           presenter: MainTabBarPresentationLogic,
           router: MainTabBarRoutingLogic
       ) {
           viewController.interactor = interactor
           viewController.router = router
           
           presenter.viewController = viewController
           
           router.viewController = viewController
           router.dataStore = interactor
       }
}

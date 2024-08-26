//
//  AppCoordinator.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    
}

class AppCoordinator: Coordinator, AppCoordinatorProtocol {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController?
    var window: UIWindow?
    
    // MARK: - Init
    
    required init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Methods
    
    func start() {
        let coordinator = PicturesFeedCoordinator(navigationController)
        coordinator.window = window
        coordinator.start()
    }
}

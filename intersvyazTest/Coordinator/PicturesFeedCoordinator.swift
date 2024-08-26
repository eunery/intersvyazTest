//
//  PicturesFeedCoordinator.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation
import UIKit

protocol PicturesFeedCoordinatorProtocol {
    func openPicture(image: UIImage, name: String)
}

class PicturesFeedCoordinator: Coordinator, PicturesFeedCoordinatorProtocol {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController?
    var window: UIWindow?
    
    // MARK: - Init

    init(_ navVC: UINavigationController?) {
        self.navigationController = navVC
    }
    
    // MARK: - Methods
    
    func start() {
        let viewController = PicturesFeedViewController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: true)
        window?.rootViewController = navigationController
    }
    
    func openPicture(image: UIImage, name: String) {
        let viewController = DetailPictureViewController(image: image, name: name)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

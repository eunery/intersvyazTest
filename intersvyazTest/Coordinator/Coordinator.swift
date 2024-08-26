//
//  Coordinator.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController? { get set }
    var window: UIWindow? { get set }
    
    func start()
}

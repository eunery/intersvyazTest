//
//  AppDelegate.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Resolver

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        Resolver.registerAllServices()
        let navVC = UINavigationController()
        appCoordinator = AppCoordinator(navVC)
        appCoordinator?.window = window
        appCoordinator?.start()
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }
}


//
//  AppDelegate.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavBar()
        initWindow()
        return true
    }
    
    private func initWindow() {
        let appRouter = AppRouter()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        appRouter.setRoot(to: .login, window: window, using: [:])
    }
    
    private func setupNavBar() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.tintColor = .white
        navAppearance.setBackgroundImage(UIImage(), for: .default)
        navAppearance.shadowImage = UIImage()
        navAppearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 24)]
    }


}


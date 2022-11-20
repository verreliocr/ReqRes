//
//  AppRouter.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation
import UIKit

class AppRouter: IRouter {
    private var navigationController: UINavigationController!
    
    func setNavigationController(_ nav: UINavigationController) {
        navigationController = nav
    }
    
    func setRoot(to module: FeatureModule, window: UIWindow? = nil, using params: [String : Any] = [:]) {
        let module = module.create(using: self)
        let viewController: UIViewController = module.resolve(using: params)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        module.router.setNavigationController(navigationController)
        window?.rootViewController = navigationController
    }
    
    func present(module: FeatureModule, asNavigation: Bool = false, using params: [String : Any] = [:]) {
        if asNavigation {
            let appRouter = AppRouter()
            let module = module.create(using: appRouter)
            let viewController: UIViewController = module.resolve(using: params)
            let nav = UINavigationController(rootViewController: viewController)
            module.router.setNavigationController(nav)
            nav.modalPresentationStyle = .fullScreen
            navigationController.present(nav, animated: true, completion: nil)
        } else {
            let module = module.create(using: self)
            let viewController: UIViewController = module.resolve(using: params)
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(viewController, animated: true, completion: nil)
        }
    }
}

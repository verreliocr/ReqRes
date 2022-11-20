//
//  IRouter.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation
import UIKit

protocol IRouter: AnyObject {
    func setNavigationController(_ nav: UINavigationController)
    func setRoot(to module: FeatureModule, window: UIWindow?, using params: [String: Any])
    func present(module: FeatureModule, asNavigation: Bool, using params: [String: Any])
}

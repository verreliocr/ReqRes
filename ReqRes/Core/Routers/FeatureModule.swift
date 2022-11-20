//
//  FeatureModule.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation
import UIKit

enum FeatureModule {
    case login
    case listUser

    func create(using router: IRouter) -> IModule {
        switch self {
        case .login:
            return LoginViewModel(appRouter: router)
        case .listUser:
            return ListUserViewModel(appRouter: router)
        }
    }
}

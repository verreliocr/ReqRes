//
//  IModule.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation
import UIKit

protocol IModule {
    var router: IRouter { get set }
    func resolve(using params: [String: Any]) -> UIViewController
}

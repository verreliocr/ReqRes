//
//  LoginViewModel.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation
import UIKit

class LoginViewModel: ILoginViewModel, IModule {
    
    weak var view: ILoginView?
    let model = LoginModel()
    let request = HTTPRequest()
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func setView(_ view: ILoginView) {
        self.view = view
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let view = LoginView(viewModel: self)
        self.setView(view)
        
        return view
    }
    
    func setEmail(_ value: String) {
        self.model.email = value
    }
    
    func setPassword(_ value: String) {
        self.model.password = value
    }
    
    private func getLoginParams() -> [String: Any] {
        var params: [String: Any] = [:]
        
        params["email"] = self.model.email
        params["password"] = self.model.password
        
        return params
    }
    
    private func didLogin() {
        request.call(.login, bodyParams: getLoginParams()) { data, type in
            if let res = LoginResponse.decode(from: data) {
                print(res)
                self.view?.showMessage("Log In Successful", title: "Info", completion: nil)
            }else if let type = type {
                self.view?.handleError(type: type, retryAction: { [weak self] in
                    self?.didLogin()
                })
            }
        }
    }
    
    func didTapLogin() {
        didLogin()
    }
}

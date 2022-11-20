//
//  LoginContract.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

protocol ILoginView: AnyObject {
    func showMessage(_ message: String, title: String, completion: (() -> Void)?)
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void))
}

protocol ILoginViewModel {
    func setView(_ view: ILoginView)
    func setEmail(_ value: String)
    func setPassword(_ value: String)
    func didTapLogin()
}

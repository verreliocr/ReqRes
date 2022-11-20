//
//  ListUserContract.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

protocol IListUserView: AnyObject {
    func showMessage(_ message: String, title: String, completion: (() -> Void)?)
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void))
}

protocol IListUserViewModel {
    func setView(_ view: IListUserView)
    func getNumberOfUsers() -> Int
    func getAvatarUrl(for row: Int) -> String
    func getFullName(for row: Int) -> String
    func getEmail(for row: Int) -> String
}

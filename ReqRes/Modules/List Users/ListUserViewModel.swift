//
//  ListUserViewModel.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation
import UIKit
import SVProgressHUD

class ListUserViewModel: IListUserViewModel, IModule {
    
    weak var view: IListUserView?
    let model = ListUserModel()
    let request = HTTPRequest()
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func setView(_ view: IListUserView) {
        self.view = view
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let view = ListUserView(viewModel: self)
        self.setView(view)
        
        return view
    }
    
    private func getListUser(appendResult: Bool) {
        SVProgressHUD.show()
        request.call(.getListUser(page: model.page), bodyParams: [:]) { [weak self] data, type in
            SVProgressHUD.dismiss()
            if let res = BaseResponse<[UserItemObject]>.decode(from: data) {
                if appendResult {
                    self?.model.total = res.total ?? 0
                    self?.model.users.append(contentsOf: res.data ?? [])
                    self?.view?.reloadView()
                }
            }else if let type = type {
                self?.view?.handleError(type: type, retryAction: { [weak self] in
                    self?.getListUser(appendResult: appendResult)
                })
            }
        }
    }
    
    func viewLoaded() {
        getListUser(appendResult: true)
    }
    
    func getNumberOfUsers() -> Int {
        return model.users.count
    }
        
    private func getUser(for row: Int) -> UserItemObject {
        return model.users[row]
    }
    
    func getAvatarUrl(for row: Int) -> String {
        return getUser(for: row).avatar ?? ""
    }
    
    func getFullName(for row: Int) -> String {
        return "\(getUser(for: row).firstName ?? "") \(getUser(for: row).lastName ?? "")"
    }
    
    func getEmail(for row: Int) -> String {
        return getUser(for: row).email ?? ""
    }
    
    func willDisplayUser(for row: Int) {
        if row == getNumberOfUsers() - 1, getNumberOfUsers() < model.total {
            self.model.page += 1
            self.getListUser(appendResult: true)
        }
    }
}

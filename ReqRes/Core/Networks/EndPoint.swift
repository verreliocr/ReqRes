//
//  EndPoint.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

private let baseURL = "https://reqres.in/api"

enum EndPoint {
    case login
    case getListUser(page: Int)
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .POST
        case .getListUser:
            return .GET
        }
    }
    
    var url: String {
        var path = ""
        switch self {
        case .login:
            path = "/login"
        case .getListUser(let page):
            path = "/users?page=\(page)"
        }
        
        return baseURL + path
    }
}

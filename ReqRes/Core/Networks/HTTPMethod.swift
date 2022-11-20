//
//  HTTPMethod.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
    
    var isGet: Bool {
        return self == .GET
    }
}

//
//  LoginResponse.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

struct LoginResponse: Codable {
    var token: String?
    
    enum CodingKeys: String, CodingKey {
        case token
    }
}

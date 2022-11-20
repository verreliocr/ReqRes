//
//  UserItemObject.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

struct UserItemObject: Codable {
    var id: Int?
    var email, firstName, lastName, avatar: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id, email, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

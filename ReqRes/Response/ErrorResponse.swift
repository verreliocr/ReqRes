//
//  ErrorResponse.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

struct ErrorResponse: Codable {
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case error
    }
}

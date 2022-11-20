//
//  BaseResponse.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var page, perPage, total, totalPages: Int?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case page, total, data
        case perPage = "per_page"
        case totalPages = "total_pages"
    }
}

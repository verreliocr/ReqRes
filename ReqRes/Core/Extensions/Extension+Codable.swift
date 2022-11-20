//
//  Extension+Codable.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

extension Decodable {
    static func decode(from data: Data?) -> Self? {
        guard let data = data else { return nil }
        return try? JSONDecoder().decode(Self.self, from: data)
    }
}

//
//  IRequest.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation

protocol IRequest {
    func call(_ endPoint: EndPoint, bodyParams: [String: Any], completion: @escaping (Data?, ErrorType?) -> Void)
}

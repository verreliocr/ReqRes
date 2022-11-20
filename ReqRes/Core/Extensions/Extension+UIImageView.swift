//
//  Extension+UIImageView.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func setImage(url: String, placeholder: UIImage?, completion: ((Error?) -> Void)? = nil) {
        guard let newUrl = URL(string: url) else { return }
        sd_setImage(with: newUrl, placeholderImage: placeholder, options: []) { (_, error, _, _) in
            completion?(error)
        }
    }
}

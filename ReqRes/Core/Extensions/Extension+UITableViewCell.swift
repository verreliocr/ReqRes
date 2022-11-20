//
//  Extension+UITableViewCell.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var defaultIdentifier: String {
        return String(describing: self)
    }
    
    static var defaultNib: UINib {
        return UINib(nibName: defaultIdentifier, bundle: Bundle(for: self))
    }
}

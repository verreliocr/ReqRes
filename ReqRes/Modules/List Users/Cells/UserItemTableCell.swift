//
//  UserItemTableCell.swift
//  ReqRes
//
//  Created by Verrelio C. Rizky on 21/11/22.
//

import UIKit

class UserItemTableCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
    func bind(avatarUrl: String, name: String, email: String) {
        userImageView.setImage(url: avatarUrl, placeholder: UIImage(systemName: "person.crop.square.fill"))
        userNameLabel.text = name
        userEmailLabel.text = email
    }
    
}

//
//  CustomTableViewCell.swift
//  DemoTabBarController
//
//  Created by Hoang Tung on 1/16/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

protocol CustomCellDisplayLogic {
    func setData(message: MessageViewModel)
}

class CustomTableViewCell: UITableViewCell, CustomCellDisplayLogic {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setup()
    }
    
    func setup() {
        self.addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        profileImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 48).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, constant: 1).isActive = true
        profileImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16).isActive = true
        
        self.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        timeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: timeLabel.leadingAnchor, constant: -16).isActive = true
        nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        self.addSubview(detailLabel)
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32).isActive = true
        detailLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16).isActive = true
    }
    
    func setData(message: MessageViewModel) {
        profileImageView.image = message.image
        nameLabel.text = message.name
        detailLabel.text = message.detail
        timeLabel.text = message.time
    }
}

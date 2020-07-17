//
//  ContactTableCell.swift
//  DiffableDataSourceDemo
//
//  Created by Ahmed Komsan on 14/07/2020.
//  Copyright © 2020 akomsan. All rights reserved.
//

import UIKit

class ContactTableCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: ContactTableCell.self)
    }
    
    var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.bounds = CGRect(x: 0, y: 0, width: 60, height: 60);
        profileImageView.layer.cornerRadius = 4
        profileImageView.layer.shadowRadius = 8
        profileImageView.layer.shadowOpacity = 0.8
        profileImageView.layer.shadowOffset = CGSize(width: 6, height: 6)
        profileImageView.layer.shadowColor = UIColor.darkGray.cgColor
        profileImageView.layer.masksToBounds = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        subtitle.textColor = UIColor.black.withAlphaComponent(0.6)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
    }
    
    func configure(with contat:Contact){
        let namePrefix = "\(contat.firstName.prefix(1))\(contat.lastName.prefix(1))"
        self.profileImageView.setImage(string: namePrefix, color:UIColor.lightGray.withAlphaComponent(0.4)  ,circular:true)
        self.titleLabel.text = "\(contat.firstName) \(contat.lastName)"
        self.subtitleLabel.text = contat.emailAddress
    }
    
}


//
//  SectionHeaderReusableView.swift
//
//
//  Created by Ahmed Komsan on 15/07/2020.
//  Copyright © 2020 akomsan. All rights reserved.
//

import UIKit

class SectionHeaderReusableView: UITableViewHeaderFooterView {
    static var reuseIdentifier: String {
        return String(describing: SectionHeaderReusableView.self)
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
        setupLayout()
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor ,constant: 2),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])
    }
    
}


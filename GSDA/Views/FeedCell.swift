//
//  PhotoCell.swift
//  GSDA
//
//  Created by Joriah Lasater on 1/25/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TITLE LABEL"
        label.font = UIFont(name: "AmericanTypewriter", size: 22)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    let photoImageView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "DenturesImg")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let descriptionLabel: UITextView = {
        let label = UITextView()
        label.text = "This template adds a long hidden comment to the page"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        label.textColor = .white
        label.isEditable = false
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        
        return label
    }()
    
    func setupCell(with model: PhotoModel) {
        
    }
    
    func setupSubViews() {
        
        addSubview(titleLabel)
        addSubview(photoImageView)
        addSubview(descriptionLabel)
        let padding: CGFloat = 30
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
        photoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: frame.width - padding * 2).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}

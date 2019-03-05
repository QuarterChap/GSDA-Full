//
//  AssignmentCell.swift
//  GSDA
//
//  Created by Work on 07/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import WebKit
class AssignmentCell: UITableViewCell {
    
    let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Assignments"
        label.font = UIFont(name: "AmericanTypewriter", size: 22)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    let descriptionLabel: UITextView = {
        let label = UITextView()
        label.text = "Placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        label.textColor = .white
        label.textAlignment = .center
        label.isEditable = false
        label.clipsToBounds = true
        label.layer.cornerRadius = 15
        return label
    }()
    
    var post: PdfModel? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        descriptionLabel.text = post?.description
        titleLbl.text = post?.title
    }
    
    func setupSubViews() {
        selectionStyle = .none
        addSubview(titleLbl)
        addSubview(descriptionLabel)
        let padding: CGFloat = 30
        
        titleLbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

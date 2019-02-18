//
//  AssignmentCell.swift
//  GSDA
//
//  Created by Work on 07/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation

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
    
    let pdfView: UIWebView = {
        let view = UIWebView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.allowsLinkPreview = true
        view.goBack()
        return view
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
    
    var post: PostModel? {
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
        addSubview(pdfView)
        addSubview(descriptionLabel)
        let padding: CGFloat = 30
        
        titleLbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pdfView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor).isActive = true
        pdfView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        pdfView.heightAnchor.constraint(equalToConstant: frame.width - (padding * 2)).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: pdfView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}

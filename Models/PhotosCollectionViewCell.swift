//
//  PhotosCollectionViewCell.swift
//  GSDA
//
//  Created by Julian Cearley on 1/10/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false 
        
        return imageView
    }()
    
    let captionLbl: UILabel = {
        let label = UILabel()
        
        label.text = "This is the caption!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(captionLbl)
        
        captionLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        captionLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        captionLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        captionLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

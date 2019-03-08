//
//  PhotoCell.swift
//  GSDA
//
//  Created by Joriah Lasater on 1/25/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
import AVFoundation

class FeedCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TITLE LABEL"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .myBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    let photoImageView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "photos")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .myBlue
        view.contentMode = .center
        return view
    }()
    
    let descriptionLabel: UITextView = {
        let label = UITextView()
        label.text = "This template adds a long hidden comment to the page"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .myBlue
        label.textColor = .white
        label.textAlignment = .center
        label.isEditable = false
        label.clipsToBounds = true
        label.layer.cornerRadius = 15
        return label
    }()
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    var post: PostModel? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        descriptionLabel.text = post?.description
        titleLabel.text = post?.title
        NotificationCenter.default.addObserver(self, selector: #selector(stopVideo), name: NSNotification.Name.init("stopVideo"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playVideo), name: NSNotification.Name.init("playVideo"), object: nil)
    }
    
    @objc func stopVideo() {
        if player?.rate != 0 {
            player?.pause()
        }
    }
    
    @objc func playVideo() {
        if player?.rate == 0 {
            player?.play()
        }
    }
    
    //Dunno if we need this, it will display the name of the person who made the post
 //   func setupUserInfo() {
   //     nameLabel.text = user?.username
  //  }
    
    func setupSubViews() {
        selectionStyle = .none
        addSubview(titleLabel)
        addSubview(photoImageView)
        addSubview(descriptionLabel)
        let padding: CGFloat = 30
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: frame.width - (padding * 2)).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}

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
        
//        if let timestamp = post?.timestamp {
//            print(timestamp)
//            let timestampDate = Date(timeIntervalSince1970: Double(timestamp))
//            let now = Date()
//            let components = Set<Calendar.Component>([.second, .minute, .hour, .day, .weekOfMonth])
//            let diff = Calendar.current.dateComponents(components, from: timestampDate, to: now)
//
//            var timeText = ""
//            if diff.second! <= 0 {
//                timeText = "Now"
//            }
//            if diff.second! > 0 && diff.minute! == 0 {
//                timeText = (diff.second == 1) ? "\(diff.second!) second ago" : "\(diff.second!) seconds ago"
//            }
//            if diff.minute! > 0 && diff.hour! == 0 {
//                timeText = (diff.minute == 1) ? "\(diff.minute!) minute ago" : "\(diff.minute!) minutes ago"
//            }
//            if diff.hour! > 0 && diff.day! == 0 {
//                timeText = (diff.hour == 1) ? "\(diff.hour!) hour ago" : "\(diff.hour!) hours ago"
//            }
//            if diff.day! > 0 && diff.weekOfMonth! == 0 {
//                timeText = (diff.day == 1) ? "\(diff.day!) day ago" : "\(diff.day!) days ago"
//            }
//            if diff.weekOfMonth! > 0 {
//                timeText = (diff.weekOfMonth == 1) ? "\(diff.weekOfMonth!) week ago" : "\(diff.weekOfMonth!) weeks ago"
//            }
        
           // GOnna use a timelabel? if yes then the code its there rdy only need to hook up the timelabel if no just remove the code above - Nick
           // timeLabel.text = timeText
//        }
        
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
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: frame.width - padding * 2).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}

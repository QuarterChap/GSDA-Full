//
//  PhotoModel.swift
//  GSDA
//
//  Created by Julian Cearley on 1/8/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseAuth

class PhotoModel {
    
    var caption: String?
    var photoUrl: String?
    var uid: String?
    var id: String?
    var ratio: CGFloat?
    var videoUrl: String?
    var timestamp: Int?
    var title: String?
    var pdf: Data?
}

extension PhotoModel {
    static func transformPostPhoto(dict: [String: Any], key: String) -> PhotoModel {
        let post = PhotoModel()
        post.id = key
        post.title = dict["title"] as? String
        post.caption = dict["caption"] as? String
        post.photoUrl = dict["photoUrl"] as? String
        post.videoUrl = dict["videoUrl"] as? String
        post.uid = dict["uid"] as? String
        post.ratio = dict["ratio"] as? CGFloat
        post.timestamp = dict["timestamp"] as? Int
        post.pdf = dict["pdf"] as? Data
      
        return post
    }
}

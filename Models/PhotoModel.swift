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
    
    // DEVSCORCH: Private Variables
    
    private var _caption: String?
    private var _uid: String?
    private var _id: String?
    private var _timeStamp: Int?
    private var _categories: String?
    private var _commentCount: Int?
    var user: ViewController?
    
    //Newly added dont know if we need this
    private var _viewCount: Int?
    
    // Initializers
    
    var categories: String? {
        get {
            return _categories
        } set {
            _categories = categories
        }
    }
    
    var caption: String? {
        get { return _caption
        } set {
            _caption = caption
        }
    }
    
    //Newly added dont know if we need this
    var viewCount: Int? {
        get {
            return _viewCount
        } set {
            _viewCount = viewCount
        }
    }
    
    var uid: String? {
        get { return _uid
        } set {
            _uid = uid
        }
    }
    
    var id: String? {
        get { return _id
        } set {
            _id = id
        }
    }
    
    var commentCount: Int? {
        return _commentCount
    }
    
    init() {
        
    }
    
}

extension PhotoModel {
    static func transformPostVideo(dict: [String: Any], key: String) -> PhotoModel {
        let post = PhotoModel()
        post._id = key
        post._caption = dict["caption"] as? String
        post._timeStamp = dict["time_stamp"] as? Int
        //Newly added dont know if we need this
        post._viewCount = dict["view_count"] as? Int
        post._categories = dict["categories"] as? String
        post._commentCount = dict["comment_count"] as? Int ?? 0
        
        return post
    }
}

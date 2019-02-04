//
//  HelperService.swift
//  GSDA
//
//  Created by Work on 25/01/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
class HelperService {
    
    static func uploadVideoToFirebaseStorage(videoUrl: URL?, title: String, ratio: CGFloat, description: String, onSuccess: @escaping (_ videoUrl: String) -> Void) {
        let videoIdString = NSUUID().uuidString
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child("postedVideo").child(videoIdString)
        let newPostId = Api.Post.REF_POSTS.childByAutoId().key
        let newPostReference = Api.Post.REF_POSTS.child(newPostId!)
        
        guard let currentUser = Api.User.CURRENT_USER else {
            return
        }
        let currentUserId = currentUser.uid
        
        let timestamp = Int(Date().timeIntervalSince1970)
        
        var dict = ["uid": currentUserId , "description": description, "title": title, "ratio": ratio, "timestamp": timestamp] as [String : Any]
        if let videoUrl = videoUrl {
            dict["videoUrl"] = videoUrl
        }
        storageRef.putFile(from: (videoUrl as? URL)!, metadata: nil) { (_, error) in
            if error != nil {
                return
            }
            storageRef.downloadURL(completion: { (url, error) in
                if let videoUrl = url?.absoluteString {
                    onSuccess(videoUrl)
                }
            })
            
        }
        newPostReference.setValue(dict, withCompletionBlock: {
            (error, ref) in
            if error != nil {
                return
            }
            
            let myPostRef = Api.MyPosts.REF_MYPOSTS.child(currentUserId).child(newPostId!)
            myPostRef.setValue(["timestamp": timestamp], withCompletionBlock: { (error, ref) in
                if error != nil {
                    return
                }
            })
            onSuccess(videoIdString)
        })
    }
    
    static func uploadImageToFirebaseStorage(data: Data, title: String, description: String, onSuccess: @escaping () -> ()) {
        let photoIdString = NSUUID().uuidString
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child("postedImage").child(photoIdString)
//        guard let _ = Api.User.CURRENT_USER else {
//            return
//        }
        
        storageRef.putData(data, metadata: nil) { (metadata, error) in
            if error != nil {
                return
            }
            storageRef.downloadURL(completion: { (url: URL?, error: Error?) in
                if let photoUrl = url?.absoluteString {
                    let data = ["title": title, "description": description, "photo_url": photoUrl, "timestamp": Int(Date().timeIntervalSince1970)] as [String: Any]
                    sendDataToPosts(dict: data, onSuccess: {
                        onSuccess()
                    })
                }
            })
        }
    }
    
    static func sendDataToPosts(dict: [String: Any], onSuccess: @escaping () -> Void) {
        let uuid = UUID().uuidString
        var newPostReference = Api.Post.REF_POSTS

        var type = ""
        if let _ = dict["video_url"] {
            type = "videos"
        } else if let _ = dict["photo_url"] {
            type = "photos"
        }
        newPostReference = newPostReference.child(type).child(uuid)
        newPostReference.setValue(dict, withCompletionBlock: {
            (error, _) in
            if let error = error {
                print(error.localizedDescription)
            }
            onSuccess()
        })
    }
}

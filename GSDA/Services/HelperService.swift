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
 /*   static func uploadDataToServer(data: Data, videoUrl: URL? = nil, ratio: CGFloat, title: String, description: String, onSuccess: @escaping () -> Void) {
        if let videoUrl = videoUrl {
            self.uploadVideoToFirebaseStorage(videoUrl: videoUrl, title: String, description: String, onSuccess: { (videoUrl) in
                uploadImageToFirebaseStorage(data: data, title: title, onSuccess: { (thumbnailImageUrl) in
                    sendDataToDatabase(photoUrl: thumbnailImageUrl, videoUrl: videoUrl, ratio: ratio, title: title, description: description, onSuccess: onSuccess)
                })
            })
        } else {
            uploadImageToFirebaseStorage(data: data, title: title, description: description) { (photoUrl) in
                self.sendDataToDatabase(photoUrl: photoUrl, ratio: ratio, title: title, description: description, onSuccess: onSuccess)
            }
        }
    }*/
    
    static func uploadVideoToFirebaseStorage(videoUrl: URL, ratio: CGFloat, title: String, description: String, onSuccess: @escaping (_ videoUrl: String) -> Void) {
        let videoIdString = NSUUID().uuidString
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child("postedVideo").child(videoIdString)
        
        
        storageRef.putFile(from: videoUrl, metadata: nil) { (_, error) in
            if error != nil {
                return
            }
            storageRef.downloadURL(completion: { (url, error) in
                if let videoUrl = url?.absoluteString {
                    onSuccess(videoUrl)
                }
            })
            
        }
    }
    
    static func uploadImageToFirebaseStorage(data: Data, title: String, description: String, onSuccess: @escaping (_ imageUrl: String) -> Void) {
        
        let photoIdString = NSUUID().uuidString
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child("postedImage").child(photoIdString)
        storageRef.putData(data, metadata: nil) { (metadata, error) in
            if error != nil {
                return
            }
            storageRef.downloadURL(completion: { (url: URL?, error: Error?) in
                if let photoUrl = url?.absoluteString {
                    onSuccess(photoUrl)
                }
                
            })
        }
    }
    
    static func sendDataToDatabase(photoUrl: String, videoUrl: String? = nil, ratio: CGFloat, title: String, description: String, onSuccess: @escaping () -> Void) {
        let newPostId = Api.Post.REF_POSTS.childByAutoId().key
        let newPostReference = Api.Post.REF_POSTS.child(newPostId!)
        
        guard let currentUser = Api.User.CURRENT_USER else {
            return
        }
        
        let currentUserId = currentUser.uid
        let timestamp = Int(Date().timeIntervalSince1970)
        
        var dict = ["uid": currentUserId ,"photoUrl": photoUrl, "title": title, "caption": description, "ratio": ratio, "timestamp": timestamp] as [String : Any]
        if let videoUrl = videoUrl {
            dict["videoUrl"] = videoUrl
        }
        
        newPostReference.setValue(dict, withCompletionBlock: {
            (error, ref) in
            if error != nil {
                return
            }
        })
    }
}

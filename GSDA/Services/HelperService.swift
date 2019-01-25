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
    static func uploadDataToServer(data: Data, videoUrl: URL? = nil, ratio: CGFloat, caption: String, onSuccess: @escaping () -> Void) {
        if let videoUrl = videoUrl {
            self.uploadVideoToFirebaseStorage(videoUrl: videoUrl, onSuccess: { (videoUrl) in
                uploadImageToFirebaseStorage(data: data, onSuccess: { (thumbnailImageUrl) in
                    sendDataToDatabase(photoUrl: thumbnailImageUrl, videoUrl: videoUrl, ratio: ratio, caption: caption, onSuccess: onSuccess)
                })
            })
        } else {
            uploadImageToFirebaseStorage(data: data) { (photoUrl) in
                self.sendDataToDatabase(photoUrl: photoUrl, ratio: ratio, caption: caption, onSuccess: onSuccess)
            }
        }
    }
    
    static func uploadVideoToFirebaseStorage(videoUrl: URL, onSuccess: @escaping (_ videoUrl: String) -> Void) {
        let videoIdString = NSUUID().uuidString
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child(videoIdString)
        
        
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
    
    static func uploadImageToFirebaseStorage(data: Data, onSuccess: @escaping (_ imageUrl: String) -> Void) {
        let photoIdString = NSUUID().uuidString
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child(photoIdString)
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

}


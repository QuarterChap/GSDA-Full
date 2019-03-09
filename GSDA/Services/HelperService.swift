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
import FirebaseAuth
class HelperService {
    
    static func addAdmin(with email: String) {
        // Get uid of email
        Database.database().reference().child("users").queryOrdered(byChild: "email").queryEqual(toValue: email).observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                if let uid = dict.keys.first {
Database.database().reference().child("admins").child(uid).setValue(true, withCompletionBlock: { (error, ref) in
                        if let error = error {
                            ProgressHUD.showError("\(error.localizedDescription)")
                            return
                        }
        
                        ProgressHUD.showSuccess("ADDED ADMIN")
                    })
                }
            } else {
                 ProgressHUD.showError("THE EMAIL NEEDS TO BE REGISTERED BEFORE ADDING ADMIN PERMS")
            }
        }
    }
    
    
    static func uploadVideoToFirebaseStorage(videoUrl: URL, thumbnail: UIImage, title: String, description: String,  onSuccess: @escaping () -> ()) {
        let uuid = NSUUID().uuidString
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child("postedVideo").child(uuid)
        let thumbnailRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("thumbnails").child(uuid)
        
        guard let thumbnailData = UIImageJPEGRepresentation(thumbnail, 0.1) else {
            return
        }
        
        thumbnailRef.putData(thumbnailData, metadata: nil) { (metadata, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            thumbnailRef.downloadURL(completion: { (thumbnailURL, error) in
                storageRef.putFile(from: videoUrl, metadata: nil) { (_, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                    storageRef.downloadURL(completion: { (url, error) in
                        if let videoURL = url?.absoluteString, let thumbnailURL = thumbnailURL?.absoluteString  {
                            let data = ["title": title, "description": description, "video_url": videoURL, "video_thumbnail_url": thumbnailURL, "timestamp": Int(Date().timeIntervalSince1970)] as [String: Any]
                            sendDataToPosts(dict: data, onSuccess: {
                                onSuccess()
                            })
                        }
                    })
                }
            })
        }
    }
    
    
    static func uploadImageToFirebaseStorage(data: Data, title: String, description: String, onSuccess: @escaping () -> ()) {
        let photoIdString = NSUUID().uuidString
        
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child("postedImage").child(photoIdString)
        
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
    
    static func uploadPDFToFirebaseStorage(data: Data, title: String, description: String, onSuccess: @escaping ()->()) {
        let pdfIdString = NSUUID().uuidString
        
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("assignment").child("pdfFiles").child(pdfIdString)
        
        storageRef.putData(data, metadata: nil) { (metadata, error) in
            if error != nil {
                return
            }
            
            storageRef.downloadURL(completion: { (url, error) in
                if let pdfURL = url?.absoluteString {
                    let data = ["title": title, "description": description, "pdf_url": pdfURL]
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
        
        var type = "none"
        if let _ = dict["video_url"] {
            type = "videos"
        } else if let _ = dict["photo_url"] {
            type = "photos"
        }  else if let _ = dict["pdf_url"] {
            type = "pdfs"
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

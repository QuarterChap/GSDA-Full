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
    
    static func uploadPdfToFirebase(pdf: Data, title: String, description: String, onSuccess: @escaping () -> ()) {
        let uuid = NSUUID().uuidString
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child("postedPdf").child(uuid)
        
        storageRef.downloadURL(completion: { (url, error) in
            if let pdf = url?.absoluteString {
                let data = ["title": title, "description": description, "pdf": pdf, "timestamp": Int(Date().timeIntervalSince1970)] as [String: Any]
                sendDataToPosts(dict: data, onSuccess: {
                    onSuccess()
                })
            }
        })
        
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
    
    static func uploadPdfToFirebase(pdfUrl: URL, title: String, description: String, onSuccess: @escaping () -> ()) {
        let pdfPath = URL.self as? String
        let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("assignments").child("pdfFiles").child(pdfPath!)
        
        storageRef.putFile(from: pdfUrl, metadata: nil) { metadata, error in
            guard let metadata = metadata else {
                return
            }
            
        let data = ["pdfUrl": pdfUrl, "title": title, "description": description] as [String : Any]
        sendDataToPosts(dict: data) {
            onSuccess()
        }
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
    
    static func sendDataToPosts(dict: [String: Any], onSuccess: @escaping () -> Void) {
        let uuid = UUID().uuidString
        var newPostReference = Api.Post.REF_POSTS

        var type = ""
        if let _ = dict["video_url"] {
            type = "videos"
        } else if let _ = dict["photo_url"] {
            type = "photos"
        } else if let _ = dict["pdfUrl"] {
            type = "pdfUrl"
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

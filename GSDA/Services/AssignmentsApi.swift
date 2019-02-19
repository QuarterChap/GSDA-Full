//
//  AssignmentsApi.swift
//  GSDA
//
//  Created by langsemJobb on 19/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseDatabase

class AssignmentsApi {
    var REF_PDF_POSTS = Database.database().reference().child("assignments")
    func observePosts(completion: @escaping (PdfModel) -> Void) {
        REF_PDF_POSTS.observe(.childAdded) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let newPost = PdfModel.transformPdf(dict: dict, key: snapshot.key)
                completion(newPost)
            }
        }
    }
    
    func observePost(withId id: String, completion: @escaping (PdfModel) -> Void) {
        REF_PDF_POSTS.child(id).observeSingleEvent(of: DataEventType.value, with: {
            snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let post = PdfModel.transformPdf(dict: dict, key: snapshot.key)
                completion(post)
            }
        })
    }
    
}

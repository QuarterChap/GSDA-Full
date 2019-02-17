//
//  PdfApi.swift
//  GSDA
//
//  Created by Work on 17/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation

class PdfApi {
    var REF_PDF = Database.database().reference().child("assigments")
    
    func observePosts(completion: @escaping (PdfModel) -> Void) {
        REF_PDF.observe(.childAdded) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let newPost = PdfModel.transformPdf(dict: dict, key: snapshot.key)
                completion(newPost)
            }
        }
    }
    
    func observePost(withId id: String, completion: @escaping (PdfModel) -> Void) {
        REF_PDFS.child(id).observeSingleEvent(of: DataEventType.value, with: {
            snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let post = PdfModel.transformPdf(dict: dict, key: snapshot.key)
                completion(post)
            }
        })
    }
}

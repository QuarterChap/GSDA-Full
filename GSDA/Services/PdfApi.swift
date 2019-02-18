//
//  PdfApi.swift
//  GSDA
//
<<<<<<< HEAD
//  Created by Work on 07/02/2019.
=======
//  Created by Work on 17/02/2019.
>>>>>>> 124deeae3f78f18719def25381cbdec3178941fd
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
<<<<<<< HEAD
=======

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
>>>>>>> 124deeae3f78f18719def25381cbdec3178941fd

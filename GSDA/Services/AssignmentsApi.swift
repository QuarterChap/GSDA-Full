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
    var REF_PDF_POSTS = Database.database().reference().child("posts").child("pdfs")
    
    func observePdfPosts(completion: @escaping ([PdfModel]) -> Void) {
        REF_PDF_POSTS.observe(.value, with: {
            snapshot in
            if let dict = snapshot.value as? [String: Any] {
                //todo handle on completion
                var posts = [PdfModel]()
                for key in dict.keys {
                    if let dict = dict[key] as? [String: Any] {
                        let post = PdfModel.transformPdf(dict: dict, uid: key)
                        posts.append(post)
                    }
                }
                completion(posts)
            }
        })
    }
    
}

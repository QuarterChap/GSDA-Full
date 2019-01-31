//
//  MyPostsApi.swift
//  GSDA
//
//  Created by Work on 31/01/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseDatabase
class MyPostsApi {
    var REF_MYPOSTS = Database.database().reference().child("myPosts")
    
    func fetchMyPosts(userId: String, completion: @escaping (String) -> Void) {
        REF_MYPOSTS.child(userId).observe(.childAdded, with: {
            snapshot in
            completion(snapshot.key)
        })
    }
    
    func fetchCountMyPosts(userId: String, completion: @escaping (Int) -> Void) {
        REF_MYPOSTS.child(userId).observe(.value, with: {
            snapshot in
            let count = Int(snapshot.childrenCount)
            completion(count)
        })
    }
}


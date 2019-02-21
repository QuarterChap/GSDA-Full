//
//  FeedApi.swift
//  GSDA
//
//  Created by Work on 31/01/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FeedApi {
    var REF_POSTS = Database.database().reference().child("posts")
    
    func observePosts(of type: String, completion: @escaping (PostModel) -> Void) {
        REF_POSTS.child(type).queryOrdered(byChild: "timestamp").observe(.childAdded, with: {
            snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let decoder = JSONDecoder()
                do {
                    let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                    let model = try decoder.decode(PostModel.self, from: data)
                    completion(model)
                } catch {
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    
    
    func getRecentFeed(withId id: String, start timestamp: Int? = nil, limit: UInt, completionHandler: @escaping ([(PhotoModel, UserModel)]) -> Void) {
        
        var feedQuery = REF_POSTS.child(id).queryOrdered(byChild: "timestamp")
        if let latestPostTimestamp = timestamp, latestPostTimestamp > 0 {
            feedQuery = feedQuery.queryStarting(atValue: latestPostTimestamp + 1, childKey: "timestamp").queryLimited(toLast: limit)
        } else {
            feedQuery = feedQuery.queryLimited(toLast: limit)
        }
        
        // Call Firebase API to retrieve the latest records
        feedQuery.observeSingleEvent(of: .value, with: { (snapshot) in
            let items = snapshot.children.allObjects
            let myGroup = DispatchGroup()
            
            
            var results: [(post: PhotoModel, user: UserModel)] = []
            
            for (_, item) in (items as! [DataSnapshot]).enumerated() {
                myGroup.enter()
                Api.Post.observePost(withId: item.key, completion: { (post) in
                    Api.User.observeUser(withId: post.uid!, completion: { (user) in
                        if post.uid == user.id {
                            results.append((post, user))
                        }
                        myGroup.leave()
                    })
                })
            }
            myGroup.notify(queue: .main) {
                results.sort(by: {$0.0.timestamp! > $1.0.timestamp! })
                completionHandler(results)
            }
            
            
        })
        
    }
    
    func getOldFeed(withId id: String, start timestamp: Int, limit: UInt, completionHandler: @escaping ([(PhotoModel, UserModel)]) -> Void) {
        
        let feedOrderQuery = REF_POSTS.child(id).queryOrdered(byChild: "timestamp")
        let feedLimitedQuery = feedOrderQuery.queryEnding(atValue: timestamp - 1, childKey: "timestamp").queryLimited(toLast: limit)
        
        feedLimitedQuery.observeSingleEvent(of: .value, with: { (snapshot) in
            let items = snapshot.children.allObjects as! [DataSnapshot]
            
            let myGroup = DispatchGroup()
            
            var results: [(post: PhotoModel, user: UserModel)] = []
            
            for (_, item) in items.enumerated() {
                print(item)
                
                myGroup.enter()
                Api.Post.observePost(withId: item.key, completion: { (post) in
                    Api.User.observeUser(withId: post.uid!, completion: { (user) in
                        if post.uid == user.id {
                            results.append((post, user))
                        }
                        myGroup.leave()
                    })
                })
            }
            myGroup.notify(queue: DispatchQueue.main, execute: {
                results.sort(by: {$0.0.timestamp! > $1.0.timestamp! })
                completionHandler(results)
            })
        })
        
    }
    
    func observeFeedRemoved(withId id: String, completion: @escaping (PhotoModel) -> Void) {
        REF_POSTS.child(id).observe(.childRemoved, with: {
            snapshot in
            let key = snapshot.key
            Api.Post.observePost(withId: key, completion: { (post) in
                completion(post)
            })
        })
    }
}


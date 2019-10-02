//
//  PhotosViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/10/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
final class PhotosViewController: FeedViewController, FeedTableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PHOTOS"
        tableViewDelegate = self
    }
    
    override func loadPosts() {
        Api.Feed.observePosts(of: "photos") { (post) in
            self.posts.append(post)
            self.feedTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func didTap(cell: FeedCell) {
        // DO nothing as of now
    }
    
    func upload() {
        let vc = UploadContentViewController()
        vc.contentType = .photo
        navigationController?.pushViewController(vc, animated: true)
    }
}

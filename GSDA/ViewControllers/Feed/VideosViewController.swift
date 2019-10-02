//
//  VideosViewController.swift
//  GSDA
//
//  Created by Joriah Lasater on 1/25/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import AVKit
final class VideosViewController: FeedViewController, FeedTableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VIDEOS"
        tableViewDelegate = self
    }
    
    override func loadPosts() {
        Api.Feed.observePosts(of: "videos") { (post) in
            self.posts.append(post)
            self.feedTableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func upload() {
        // vc.contentType is by default .video 
        navigationController?.pushViewController(UploadContentViewController(), animated: true)
    }
    
    func didTap(cell: FeedCell) {
        let videoViewController = AVPlayerViewController()

        guard let videoURLString = cell.post?.video_url, let videoURL = URL(string: videoURLString) else {
            return
        }
        videoViewController.player = AVPlayer(url: videoURL)
        present(videoViewController, animated: true, completion: nil)
    }
}

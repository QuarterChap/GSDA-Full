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
        titleLabel.text = "Videos"
        tableViewDelegate = self
    }

    override func loadPosts() {
        Api.Feed.observePosts(of: "videos") { (post) in
            self.posts.append(post)
            self.feedTableView.reloadData()
        }
    }
    
    func upload() {
        present(UploadContentViewController(), animated: true, completion: nil)
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

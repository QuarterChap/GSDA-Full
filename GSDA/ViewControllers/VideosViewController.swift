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
    
    func didTap(cell: FeedCell) {
        let videoViewController = AVPlayerViewController()

        guard let videoURL = URL(string: "https://www.youtube.com/watch?v=0PnQTeNzrLI") else {
            return
        }
        videoViewController.player = AVPlayer(url: videoURL)
        present(videoViewController, animated: true, completion: nil)
    }
    
}

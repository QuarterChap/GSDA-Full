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
        titleLabel.text = "Pictures"
        tableViewDelegate = self
    }
    
    func didTap(cell: FeedCell) {
        // DO nothing as of now
    }
    
    func upload() {
        present(UploadContentViewController(), animated: true, completion: nil)
    }
}

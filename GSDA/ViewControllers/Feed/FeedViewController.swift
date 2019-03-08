//
//  FeedViewController.swift
//  GSDA
//
//  Created by Joriah Lasater on 1/25/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FeedViewController: UIViewController {
    
    var previousVC = UserDefaults.standard.string(forKey: "previousVC")
    var tableViewDelegate: FeedTableViewDelegate?
    var posts = [PostModel]()
    
    var imageCache = [String: UIImage]()
    var loadingImages = [String]()
    
    lazy var feedTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FeedCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        return tableView
    }()
    
    lazy var uploadButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = .myBlue
        button.setTitle("UPLOAD", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleUpload), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setupView()
        loadPosts()
    }
    
    //Loading the posts
    func loadPosts() {}
    
    //DIsplay the new posts thats added
    private func displayNewPosts(newPosts posts: [PhotoModel]) {
        guard posts.count > 0 else {
            return
        }
        var indexPaths:[IndexPath] = []
        self.feedTableView.beginUpdates()
        for post in 0...(posts.count - 1) {
            let indexPath = IndexPath(row: post, section: 0)
            indexPaths.append(indexPath)
        }
        self.feedTableView.insertRows(at: indexPaths, with: .none)
        self.feedTableView.endUpdates()
    }
    
    func setupView() {
        view.addSubview(feedTableView)
        view.addSubview(uploadButton)
        
        feedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        feedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        feedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        feedTableView.bottomAnchor.constraint(equalTo: uploadButton.topAnchor, constant: -10).isActive = true
        
        uploadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        uploadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        uploadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        uploadButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func handleMainMenu() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleUpload() {
        tableViewDelegate?.upload()
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts.isEmpty {
            return 0
        }
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedCell,
            !posts.isEmpty else {
                return UITableViewCell()
        }
        
        cell.setupSubViews()
        
        let post = posts[indexPath.row]
        cell.post = post
        // Download images or videos
        cell.photoImageView.image = UIImage(named: "photos")
        cell.photoImageView.contentMode = .center
        if let imageURLString = post.photo_url {
            handleLoadingImage(for: imageURLString) { (image) in
                cell.photoImageView.image = image
                cell.photoImageView.contentMode = .scaleToFill
            }
        } else if let videoThumbnailURLString = post.video_thumbnail_url {
            handleLoadingImage(for: videoThumbnailURLString) { (image) in
                cell.photoImageView.image = image
                cell.photoImageView.contentMode = .scaleToFill
            }
        }
        
        return cell
    }
    
    func handleLoadingImage(for imageURL: String, completion: @escaping (UIImage)->()) {
        if let loadedImage = imageCache[imageURL] {
            completion(loadedImage)
        } else {
            loadingImages.append(imageURL)
            UIImage.from(imageURL: imageURL) { [weak self] (image) in
                self?.imageCache.updateValue(image, forKey: imageURL)
                if let index = self?.loadingImages.lastIndex(of: imageURL) {
                    self?.loadingImages.remove(at: index)
                }
                completion(image)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // Get Model
        let index = indexPath.row
        let model = posts[index]
        let descriptionLength = model.description.count
        // 60 char a line
        let charsPerLine = 60
        let lines = descriptionLength / charsPerLine
        
        return 400 + CGFloat(lines * 10)
        
        // Check Description length
        // Change size depending on length
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? FeedCell {
            tableViewDelegate?.didTap(cell: cell)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name.init("stopVideo"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name.init("playVideo"), object: nil)
        
    }
}

protocol FeedTableViewDelegate {
    
    func upload()
    
    func didTap(cell: FeedCell)
}

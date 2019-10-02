//
//  AssignmentViewController.swift
//  GSDA
//
//  Created by Work on 06/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class AssignmentViewController: UIViewController {
 
    //The TableView
    var previousVC = UserDefaults.standard.string(forKey: "previousVC")
    var posts = [PdfModel]()

    lazy var feedTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AssignmentCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.customBlue
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
        view.backgroundColor = .white
        setupView()
        title = "ASSIGNMENTS"
        reloadView()
    }
    
    var isAdmin = false
    func reloadView() {
        uploadButton.isHidden = !isAdmin
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        fetchPostPdf()
        UserApi().isUserAdmin { (isAdmin) in
            self.isAdmin = isAdmin
            self.reloadView()
        }
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
    
    @objc func handleUpload() {
      navigationController?.pushViewController(PdfUploadViewController(), animated: true)
    }
    
    func didTap(cell: AssignmentCell) {
        navigationController?.pushViewController(WKWebViewController().configured {
            $0.title = cell.post?.title
            $0.url = cell.post?.pdf_url
        }, animated: true)
    }
    
    func fetchPostPdf() {
        // Do any additional setup after loading the view.
        AssignmentsApi().observePdfPosts { (models) in
            self.posts.removeAll()
            self.posts = models
            self.feedTableView.reloadData()
        }
    }
    
    
}

protocol AssignmentTableViewDelegate {
    
    func upload()
    
    func didTap(cell: AssignmentCell)
}

extension AssignmentViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts.isEmpty {
            return 0
        }
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AssignmentCell,
            !posts.isEmpty else {
                return UITableViewCell()
        }
        cell.setupSubViews()
        
        let post = posts[indexPath.row]
        cell.post = post
        // Download pdf put something here
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index = indexPath.row
        let model = posts[index]
        let descriptionLength = model.description.count
        let charsPerLine = 50
        let lines = descriptionLength / charsPerLine
        
        return 65 + CGFloat(lines * 10)
        
        // Check Description length
        // Change size depending on length
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AssignmentCell {
            didTap(cell: cell)
        }
    }
}

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
    var tableViewDelegate: AssignmentTableViewDelegate?
    var posts = [PdfModel]()
    

    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Assignments"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        return label
    }()
    
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
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Upload", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleUpload), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        return button
    }()

    lazy var mainMenuButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Main Menu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleMainMenu), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setupView()
        
    }
    
    func setupView() {
        view.addSubview(mainMenuButton)
        view.addSubview(titleLbl)
        view.addSubview(feedTableView)
        view.addSubview(uploadButton)
        titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        titleLbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        titleLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        feedTableView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor).isActive = true
        feedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        feedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        feedTableView.bottomAnchor.constraint(equalTo: uploadButton.topAnchor, constant: -10).isActive = true
        
        uploadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        uploadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        uploadButton.bottomAnchor.constraint(equalTo: mainMenuButton.topAnchor, constant: -10).isActive = true
        uploadButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
    }
    
    @objc func handleUpload() {
        tableViewDelegate?.upload()
    }
    
    @objc func handleMainMenu() {
        dismiss(animated: true, completion: nil)
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
        
        // Get Model
        let index = indexPath.row
        let model = posts[index]
        let descriptionLength = model.description!.count
        // 20 char a line
        let charsPerLine = 20
        let lines = descriptionLength / charsPerLine
        
        return 400 + CGFloat(lines * 10)
        
        // Check Description length
        // Change size depending on length
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AssignmentCell {
            tableViewDelegate?.didTap(cell: cell)
        }
    }
}

//
//  FeedViewController.swift
//  GSDA
//
//  Created by Joriah Lasater on 1/25/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var previousVC = UserDefaults.standard.string(forKey: "previousVC")
    var tableViewDelegate: FeedTableViewDelegate?
    
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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TITLE"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        view.addSubview(mainMenuButton)
        view.addSubview(titleLabel)
        view.addSubview(feedTableView)
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        titleLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        feedTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        feedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        feedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        feedTableView.bottomAnchor.constraint(equalTo: mainMenuButton.topAnchor).isActive = true
        
        mainMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
    }
    
    @objc func handleMainMenu() {
        dismiss(animated: true, completion: nil)
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FeedCell()
        cell.setupSubViews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? FeedCell {
            tableViewDelegate?.didTap(cell: cell)
        }
    }
}

protocol FeedTableViewDelegate {
    
    func didTap(cell: FeedCell)
}


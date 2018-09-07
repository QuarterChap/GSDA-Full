//
//  MainMenuViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 9/1/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import Firebase

class MainMenuViewController: UIViewController {
    
    let CategoriesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .black
        return scrollView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let mottoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Just twelve weeks to a new career!"
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var scheduleButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
        button.setTitle("Schedule", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(scheduleButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var courseMaterialButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Course Material", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(courseMaterialButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var assignmentsButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Assignments", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(assignmentsButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Contact", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(contactButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Log Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(logOutButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 145, g: 183, b: 219)
        navigationItem.title = "MainMenuViewController"
        
        view.addSubview(logoImageView)
        view.addSubview(mottoLabel)
        view.addSubview(CategoriesScrollView)
        
        setupLogoImageView()
        setupMottoLabel()
        setupLogOutButton()
        setupScrollView()
    }
    
    func setupLogoImageView() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    func setupMottoLabel() {
        mottoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mottoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -1).isActive = true
        mottoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        mottoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mottoLabel.font = UIFont(name: "SavoyeLetPlain", size: view.frame.width / 11)
    }
    
    func setupScrollView() {
        // constrain the scroll view to 8-pts on each side
        CategoriesScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        CategoriesScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
     
        CategoriesScrollView.addSubview(scheduleButton)
        scheduleButton.leftAnchor.constraint(equalTo: CategoriesScrollView.leftAnchor, constant: 0).isActive = true
        scheduleButton.topAnchor.constraint(equalTo: CategoriesScrollView.topAnchor, constant: 0).isActive = true
        scheduleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        scheduleButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    func setupLogOutButton() {
        
    }
    
    @objc func scheduleButtonAction() {
        
    }
    
    @objc func courseMaterialButtonAction() {
        
    }
    
    @objc func assignmentsButtonAction() {
        
    }
    
    @objc func contactButtonAction() {
        let mmvc = ContactViewController() as UIViewController
        self.navigationController?.pushViewController(mmvc, animated: true)
    }
    
    @objc func logOutButtonAction() {
        let mmvc = ViewController() as UIViewController
        self.navigationController?.pushViewController(mmvc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}

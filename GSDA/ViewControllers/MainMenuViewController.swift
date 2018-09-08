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
    
    var signedIn = UserDefaults.standard.bool(forKey: "signedIn")
    
    let CategoriesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .black
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        
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
        button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
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
    
    lazy var downloadButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("fifth", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(contactButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var sixthButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("sixth", for: .normal)
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
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 145, g: 183, b: 219)
        navigationItem.title = "MainMenuViewController"
        
        view.addSubview(logoImageView)
        view.addSubview(mottoLabel)
        view.addSubview(CategoriesScrollView)
        view.addSubview(logoutButton)
        
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
        CategoriesScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 65).isActive = true
        CategoriesScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        CategoriesScrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55).isActive = true
        
        CategoriesScrollView.addSubview(scheduleButton)
        scheduleButton.leftAnchor.constraint(equalTo: CategoriesScrollView.leftAnchor, constant: 10).isActive = true
        scheduleButton.topAnchor.constraint(equalTo: CategoriesScrollView.topAnchor, constant: 10).isActive = true
        scheduleButton.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.3).isActive = true
        scheduleButton.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.3).isActive = true
        
        CategoriesScrollView.addSubview(courseMaterialButton)
        courseMaterialButton.leftAnchor.constraint(equalTo: CategoriesScrollView.leftAnchor, constant: 10).isActive = true
        courseMaterialButton.centerYAnchor.constraint(equalTo: CategoriesScrollView.centerYAnchor, constant: 0).isActive = true
        courseMaterialButton.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.3).isActive = true
        courseMaterialButton.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.3).isActive = true
        
        CategoriesScrollView.addSubview(assignmentsButton)
        assignmentsButton.leftAnchor.constraint(equalTo: CategoriesScrollView.leftAnchor, constant: 10).isActive = true
        assignmentsButton.bottomAnchor.constraint(equalTo: CategoriesScrollView.bottomAnchor, constant: 10).isActive = true
        assignmentsButton.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.3).isActive = true
        assignmentsButton.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.3).isActive = true
        
    }
    
    func setupLogOutButton() {
        logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        logoutButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
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
        signedIn = false
        UserDefaults.standard.set(false, forKey: "signedIn")
        UserDefaults.standard.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}

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
        scrollView.backgroundColor = .white
        scrollView.alpha = 0.85
        scrollView.layer.cornerRadius = 15
        scrollView.layer.masksToBounds  = true
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
    //falta button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
    lazy var button3: UIButton = {
        let button = UIButton(type:  .system)

        button.setTitle("Schedule", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(scheduleButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var button4: UIButton = {
        let button = UIButton(type:  .system)

        button.setTitle("Course Material", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 8)
        button.addTarget(self, action: #selector(courseMaterialButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton(type:  .system)

        button.setTitle("Assignments", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(assignmentsButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var button6: UIButton = {
        let button = UIButton(type:  .system)

        button.setTitle("Contact", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(contactButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton(type:  .system)

        button.setTitle("fifth", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(contactButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var button5: UIButton = {
        let button = UIButton(type:  .system)

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
        
        CategoriesScrollView.addSubview(button3)
        button3.centerXAnchor.constraint(equalTo: CategoriesScrollView.centerXAnchor, constant: -75).isActive  = true
        button3.centerYAnchor.constraint(equalTo: CategoriesScrollView.centerYAnchor, constant: 0).isActive = true
        button3.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        button3.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        
        CategoriesScrollView.addSubview(button4)
        button4.centerXAnchor.constraint(equalTo: CategoriesScrollView.centerXAnchor, constant: 75).isActive = true
        button4.centerYAnchor.constraint(equalTo: CategoriesScrollView.centerYAnchor, constant: 0).isActive = true
        button4.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        button4.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        
        CategoriesScrollView.addSubview(button1)
        button1.centerXAnchor.constraint(equalTo: button3.centerXAnchor).isActive = true
        button1.centerYAnchor.constraint(equalTo: CategoriesScrollView.centerYAnchor, constant: -115).isActive = true
        button1.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        button1.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        
        CategoriesScrollView.addSubview(button2)
        button2.centerXAnchor.constraint(equalTo: button4.centerXAnchor).isActive = true
        button2.centerYAnchor.constraint(equalTo: CategoriesScrollView.centerYAnchor, constant: -115).isActive = true
        button2.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        button2.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        
        CategoriesScrollView.addSubview(button5)
        button5.centerXAnchor.constraint(equalTo: button3.centerXAnchor).isActive = true
        button5.centerYAnchor.constraint(equalTo: CategoriesScrollView.centerYAnchor, constant: 115).isActive = true
        button5.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        button5.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        
        CategoriesScrollView.addSubview(button6)
        button6.centerXAnchor.constraint(equalTo: button4.centerXAnchor).isActive = true
        button6.centerYAnchor.constraint(equalTo: CategoriesScrollView.centerYAnchor, constant: 115).isActive = true
        button6.widthAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        button6.heightAnchor.constraint(equalTo: CategoriesScrollView.widthAnchor, multiplier: 0.25).isActive = true
        
    }
    
    func setupLogOutButton() {
        logoutButton.topAnchor.constraint(equalTo: CategoriesScrollView.bottomAnchor, constant: 15).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        logoutButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
    }
    
    @objc func scheduleButtonAction() {
        let mmvc = ScheduleViewController() as UIViewController
        self.navigationController?.pushViewController(mmvc, animated: true)
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

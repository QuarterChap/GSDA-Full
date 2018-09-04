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
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
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
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        navigationItem.title = "MainMenuViewController"
        
        view.addSubview(logoImageView)
        view.addSubview(mottoLabel)
        view.addSubview(scheduleButton)
        view.addSubview(courseMaterialButton)
        view.addSubview(assignmentsButton)
        view.addSubview(contactButton)
        view.addSubview(logoutButton)
        
        setupLogoImageView()
        setupMottoLabel()
        setupScheduleButton()
        setupCourseMaterialButton()
        setupAssignmentsButton()
        setupContactButton()
        setupLogOutButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupLogoImageView() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant:  150).isActive = true
    }
    
    func setupMottoLabel() {
        mottoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mottoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 2.5).isActive = true
        mottoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        mottoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupScheduleButton() {
        scheduleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scheduleButton.topAnchor.constraint(equalTo: mottoLabel.bottomAnchor, constant: 15).isActive = true
        scheduleButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        scheduleButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupCourseMaterialButton() {
        courseMaterialButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        courseMaterialButton.topAnchor.constraint(equalTo: scheduleButton.bottomAnchor, constant: 25).isActive = true
        courseMaterialButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        courseMaterialButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupAssignmentsButton() {
        assignmentsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        assignmentsButton.topAnchor.constraint(equalTo: courseMaterialButton.bottomAnchor, constant: 25).isActive = true
        assignmentsButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        assignmentsButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupContactButton() {
        contactButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contactButton.topAnchor.constraint(equalTo: assignmentsButton.bottomAnchor, constant: 25).isActive = true
        contactButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        contactButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupLogOutButton() {
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.topAnchor.constraint(equalTo: contactButton.bottomAnchor, constant: 75).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
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

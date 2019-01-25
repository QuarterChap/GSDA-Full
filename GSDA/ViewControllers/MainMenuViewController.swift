//
//  MainMenuViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 10/7/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import Firebase

class MainMenuViewController: UIViewController {
    
    var user: UserModel!
    var previousVC = UserDefaults.standard.string(forKey: "previousVC")
    
    let scrollView: UIScrollView = {
       let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor(displayP3Red: 166/255, green: 210/255, blue: 253/255, alpha: 0.5)
        sv.bounces = true
        sv.alwaysBounceVertical = true
        sv.alwaysBounceHorizontal = false
        sv.layer.zPosition = 0
        
        return sv
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let welcomeLbl: UILabel = {
       let label = UILabel()
        
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()

    lazy var homeButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("🏠   Home", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var tuitionFeesButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("📈   Tuition and Fees", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(tuitionAndFeesAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var admissionRequirementsButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("📋   Admission Requirements", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(admissionRequirmentsAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var scheduleButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("🗓   Schedule", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var enrollButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("🎓   Enroll", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(enrollButtonAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var financialAidButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("💵   Financial Aid", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(financialAidAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var locationsButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("📍   Locations", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(locationsAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var photosButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("🖼   Photos", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(photosAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var instructionalVideosButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("🎬   Instructional Videos", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(instructionalVideosAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var courseMaterialButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("📓   Course Material", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(courseMaterialAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var assignmentsButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("📝   Assignments", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(assignmentsAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var accountSettingsButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("⚙️   Account Settings", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(accountSettingsAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var aboutButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("📰   About GSDA", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(aboutAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("📞   Contact", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(contactAction), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    let label1: UILabel = {
       let label = UILabel()
        
        label.text = "Upcoming Classes"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        
        label.text = "January 2019 - Roswell, Woodstock, Kennesaw available"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        
        label.text = "April 2019 - Roswell, Woodstock or Kennesaw available"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        
        label.text = "Expanded duty - April 2019"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.white
        navigationItem.title = "MainMenuViewController"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1075)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1225)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1325)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1400)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1500)
        }
        
        setupView()
        setupScrollView()
        
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        
        let data = UserDefaults.standard
        let username = data.string(forKey: "Username")
        //welcomeLbl.text = "Welcome, \(username!)"
    }
    
    //fetch user from database and retrieve the username
    /*func fetchCurrentUser() {
        UserObserver().observeCurrentUser {[weak self] (user) in
            self!.user = user
            self?.welcomeLbl.text = "Welcome, \(user.username)"
            
        }
    }*/
    
    func setupView() {
        view.addSubview(logoImageView)
        view.addSubview(welcomeLbl)
        view.addSubview(scrollView)
        
        welcomeLbl.leftAnchor.constraint(equalTo: logoImageView.leftAnchor, constant: (view.frame.width * 0.2)).isActive = true
        welcomeLbl.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        welcomeLbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        welcomeLbl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.055).isActive = true
        welcomeLbl.font = UIFont(name: "SavoyeLetPlain", size: view.frame.width / 12)
        
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.85).isActive = true
        
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width / 32).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(view.frame.width * 0.05)).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        
    }
    
    func setupScrollView() {
        scrollView.addSubview(homeButton)
        scrollView.addSubview(accountSettingsButton)
        scrollView.addSubview(enrollButton)
        scrollView.addSubview(scheduleButton)
        scrollView.addSubview(tuitionFeesButton)
        scrollView.addSubview(admissionRequirementsButton)
        scrollView.addSubview(financialAidButton)
        scrollView.addSubview(assignmentsButton)
        scrollView.addSubview(courseMaterialButton)
        scrollView.addSubview(locationsButton)
        scrollView.addSubview(instructionalVideosButton)
        scrollView.addSubview(photosButton)
        scrollView.addSubview(contactButton)
        scrollView.addSubview(aboutButton)
        scrollView.addSubview(label1)
        scrollView.addSubview(label2)
         scrollView.addSubview(label3)
         scrollView.addSubview(label4)
        
        homeButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        homeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        homeButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        homeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        homeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        accountSettingsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        accountSettingsButton.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 15).isActive = true
        accountSettingsButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        accountSettingsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        accountSettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        enrollButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        enrollButton.topAnchor.constraint(equalTo: accountSettingsButton.bottomAnchor, constant: 15).isActive = true
        enrollButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        enrollButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        enrollButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        scheduleButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scheduleButton.topAnchor.constraint(equalTo: enrollButton.bottomAnchor, constant: 15).isActive = true
        scheduleButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        scheduleButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        scheduleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        tuitionFeesButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        tuitionFeesButton.topAnchor.constraint(equalTo: scheduleButton.bottomAnchor, constant: 15).isActive = true
        tuitionFeesButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        tuitionFeesButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        tuitionFeesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        admissionRequirementsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        admissionRequirementsButton.topAnchor.constraint(equalTo: tuitionFeesButton.bottomAnchor, constant: 15).isActive = true
        admissionRequirementsButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        admissionRequirementsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        admissionRequirementsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        financialAidButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        financialAidButton.topAnchor.constraint(equalTo: admissionRequirementsButton.bottomAnchor, constant: 15).isActive = true
        financialAidButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        financialAidButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        financialAidButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        assignmentsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        assignmentsButton.topAnchor.constraint(equalTo: financialAidButton.bottomAnchor, constant: 15).isActive = true
        assignmentsButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        assignmentsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        assignmentsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        courseMaterialButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        courseMaterialButton.topAnchor.constraint(equalTo: assignmentsButton.bottomAnchor, constant: 15).isActive = true
        courseMaterialButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        courseMaterialButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        courseMaterialButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        locationsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        locationsButton.topAnchor.constraint(equalTo: courseMaterialButton.bottomAnchor, constant: 15).isActive = true
        locationsButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        locationsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        locationsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        instructionalVideosButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        instructionalVideosButton.topAnchor.constraint(equalTo: locationsButton.bottomAnchor, constant: 15).isActive = true
        instructionalVideosButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        instructionalVideosButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        instructionalVideosButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        photosButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        photosButton.topAnchor.constraint(equalTo: instructionalVideosButton.bottomAnchor, constant: 15).isActive = true
        photosButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        photosButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        photosButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        contactButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contactButton.topAnchor.constraint(equalTo: photosButton.bottomAnchor, constant: 15).isActive = true
        contactButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        contactButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        contactButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        aboutButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        aboutButton.topAnchor.constraint(equalTo: contactButton.bottomAnchor, constant: 15).isActive = true
        aboutButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        aboutButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
         label1.topAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 25).isActive = true
         label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
         label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
         label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
         
         label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
         label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 15).isActive = true
         label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
         label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
         label2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 14)
         
         label3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
         label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15).isActive = true
         label3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
         label3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
         label3.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 14)
         
         label4.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
         label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 15).isActive = true
         label4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
         label4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
         label4.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 14)
        
    }
    
    @objc func homeButtonAction() {
        self.present(HomeViewController(), animated: true) {}
    }
    
    @objc func accountSettingsAction() {
        
    }
    
    @objc func enrollButtonAction() {
        self.present(EnrollViewController(), animated: true) {}
    }
    
    @objc func scheduleAction() {
        
    }
    
    @objc func tuitionAndFeesAction() {
        self.present(TuitionAndFeesViewController(), animated: true) {}
    }
    
    @objc func admissionRequirmentsAction() {
        self.present(AdmissionRequirementsViewController(), animated: true) {}
    }
    
    @objc func financialAidAction() {
        
    }
    
    @objc func assignmentsAction() {
        
    }
    
    @objc func courseMaterialAction() {
        
    }
    
    @objc func locationsAction() {
        self.present(LocationsViewController(), animated: true) {}
    }
    
    @objc func instructionalVideosAction() {
        //self.present(InstructionalVideosViewController(), animated: true) {}
    }
    
    @objc func photosAction() {
        let photosVC = PhotosViewController()
        present(photosVC, animated: true) {}
    }
    
    @objc func contactAction() {
        
    }
    
    @objc func aboutAction() {
     self.present(AboutUsViewController(), animated: true) {}
    }
    
}

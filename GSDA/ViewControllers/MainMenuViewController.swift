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
    
    let scrollView: UIScrollView = {
       let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alpha = 1
        sv.layer.cornerRadius = 15
        sv.layer.masksToBounds  = true
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
        
        label.text = "Welcome, "
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()

    let homeButton: UIButton = {
       let button = UIButton()
        
        button.setImage(UIImage(named: "homeButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let tuitionFeesButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "tuitionAndFeesImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let admissionRequirementsButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "admissionRequirementsButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let scheduleButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "ScheduleButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let enrollButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "enrollButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let financialAidButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "FinancialAidButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let locationsButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "LocationsButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let photosButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "PhotosButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let instructionalVideosButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "InstructionalVideosButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let courseMaterialButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "CourseMaterialButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let assignmentsButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "AssignmentsButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let accountSettingsButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "AccountSettingsButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let aboutButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "AboutGSDAButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    let contactButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "ContactButtonImg"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        button.layer.zPosition = 1
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "MainMenuViewController"
        
        scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 4305)
        
        view.addSubview(logoImageView)
        view.addSubview(welcomeLbl)
        view.addSubview(scrollView)
        
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        scrollView.addSubview(homeButton)
        
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width / 32).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width / 8).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        
        welcomeLbl.leftAnchor.constraint(equalTo: logoImageView.leftAnchor, constant: (view.frame.width * 0.2)).isActive = true
        welcomeLbl.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        welcomeLbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        welcomeLbl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.055).isActive = true
        welcomeLbl.font = UIFont(name: "SavoyeLetPlain", size: view.frame.width / 12)
        
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        
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
        
        homeButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        homeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        homeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        homeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        accountSettingsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        accountSettingsButton.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10).isActive = true
        accountSettingsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        accountSettingsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        enrollButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        enrollButton.topAnchor.constraint(equalTo: accountSettingsButton.bottomAnchor, constant: 10).isActive = true
        enrollButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        enrollButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        scheduleButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scheduleButton.topAnchor.constraint(equalTo: enrollButton.bottomAnchor, constant: 10).isActive = true
        scheduleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        scheduleButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        tuitionFeesButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        tuitionFeesButton.topAnchor.constraint(equalTo: scheduleButton.bottomAnchor, constant: 10).isActive = true
        tuitionFeesButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        tuitionFeesButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        admissionRequirementsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        admissionRequirementsButton.topAnchor.constraint(equalTo: tuitionFeesButton.bottomAnchor, constant: 10).isActive = true
        admissionRequirementsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        admissionRequirementsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        financialAidButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        financialAidButton.topAnchor.constraint(equalTo: admissionRequirementsButton.bottomAnchor, constant: 10).isActive = true
        financialAidButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        financialAidButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        assignmentsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        assignmentsButton.topAnchor.constraint(equalTo: financialAidButton.bottomAnchor, constant: 10).isActive = true
        assignmentsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        assignmentsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        courseMaterialButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        courseMaterialButton.topAnchor.constraint(equalTo: assignmentsButton.bottomAnchor, constant: 10).isActive = true
        courseMaterialButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        courseMaterialButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        locationsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        locationsButton.topAnchor.constraint(equalTo: courseMaterialButton.bottomAnchor, constant: 10).isActive = true
        locationsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        locationsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        instructionalVideosButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        instructionalVideosButton.topAnchor.constraint(equalTo: locationsButton.bottomAnchor, constant: 10).isActive = true
        instructionalVideosButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        instructionalVideosButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        photosButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        photosButton.topAnchor.constraint(equalTo: instructionalVideosButton.bottomAnchor, constant: 10).isActive = true
        photosButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        photosButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        contactButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contactButton.topAnchor.constraint(equalTo: photosButton.bottomAnchor, constant: 10).isActive = true
        contactButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        contactButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        aboutButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        aboutButton.topAnchor.constraint(equalTo: contactButton.bottomAnchor, constant: 10).isActive = true
        aboutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        aboutButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
    }
    
    @objc func homeButtonAction() {
        self.present(HomeViewController(), animated: true) {}
    }
    
    @objc func tuitionFeesButtonAction() {
        
    }
    
}

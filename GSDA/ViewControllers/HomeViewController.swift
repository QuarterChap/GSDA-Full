//
//  HomeViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/10/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class HomeViewController: UIViewController {

    var previousVC = UserDefaults.standard.string(forKey: "previousVC")
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.white
        sv.alpha = 1
        sv.bounces = true
        sv.alwaysBounceVertical = true
        sv.alwaysBounceHorizontal = false
        sv.layer.zPosition = 0
        
        return sv
    }()
    
    let label1: UILabel = {
       let label = UILabel()
        
        label.text = "Learn To Be A Dental Assitant"
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
    
    let label2: UILabel = {
        let label = UILabel()
        
        label.text = "Approved by the Georgia Board of Dentistry"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        
        label.text = "Just 12 weeks to a new career!"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let enrollButton: UIButton = {
       let button = UIButton()
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("Enroll Today", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleEnroll), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let programInfoButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "ProgramInfoImg"), for: UIControlState.normal)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleProgramInfo), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let locationsButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "LocationsImg"), for: UIControlState.normal)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleLocations), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let classScheduleButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "ClassScheduleImg"), for: UIControlState.normal)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleClassSchedule), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        
        label.text = "We can train you in 12 weeks, with 78 hours of lecture and lab, plus a 50 hour internship with a practicing dentist. After you graduate you’ll have the skills to get a job immediately."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let videoView: UIWebView = {
        let view = UIWebView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.layer.masksToBounds  = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    let seeProgramInfoButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("See Program Information", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleProgramInfo), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let label5: UILabel = {
        let label = UILabel()
        
        label.text = "WOULD YOU LIKE A CAREER WITH JOB SECURITY, GOOD PAY AND PROFESSIONAL WORK ENVIRONMENT? IF YOU SAID, “YES” THEN A CAREER, AS A DENTAL ASSISTANT MAY BE RIGHT FOR YOU."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 158, g: 170, b: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let image1: UIImageView = {
       let imageView = UIImageView()
       
        imageView.image = UIImage(named: "Img1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let label6: UILabel = {
        let label = UILabel()
        
        label.text = "According to the Bureau for Labor Statistics, employment in this field is expected to grow much faster than the average for all occupations through 2024. Currently there are more openings available than there are Dental Assistants to go around! The demand is there–why not take advantage of this opportunity?"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label7: UILabel = {
        let label = UILabel()
        
        label.text = "✔︎ Your job as a Dental Assistant is recession-proof"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label8: UILabel = {
        let label = UILabel()
        
        label.text = "✔︎ You’ll work in a professional environment assisting with dental procedures, lab work and office duties."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label9: UILabel = {
        let label = UILabel()
        
        label.text = "✔︎ You can earn $12 to $20 per hour"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label10: UILabel = {
        let label = UILabel()
        
        label.text = "✔︎ Your job may come with benefits such as paid vacation, and sick leave, medical and hospitalization, reimbursement for continuing education course fees, pension plans (401k) and profit sharing or bonus plan."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label11: UILabel = {
        let label = UILabel()
        
        label.text = "✔︎ You can find employment anywhere in the United States"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
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
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "HomeViewController"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 2550)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 2935)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3210)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3335)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3650)
        }
        
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        self.view.addSubview(mainMenuButton)
        
        mainMenuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: mainMenuButton.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
        
    }
    
    func setupScrollView() {
        
        scrollView.addSubview(label1)
        scrollView.addSubview(label2)
        scrollView.addSubview(label3)
        scrollView.addSubview(enrollButton)
        scrollView.addSubview(programInfoButton)
        scrollView.addSubview(locationsButton)
        scrollView.addSubview(classScheduleButton)
        scrollView.addSubview(label4)
        scrollView.addSubview(videoView)
        scrollView.addSubview(seeProgramInfoButton)
        scrollView.addSubview(label5)
        scrollView.addSubview(image1)
        scrollView.addSubview(label6)
        scrollView.addSubview(label7)
        scrollView.addSubview(label8)
        scrollView.addSubview(label9)
        scrollView.addSubview(label10)
        scrollView.addSubview(label11)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10).isActive = true
        label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 25)
        
        label3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 25).isActive = true
        label3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        label3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.085).isActive = true
        label3.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        enrollButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        enrollButton.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 15).isActive = true
        enrollButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.45).isActive = true
        enrollButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.085).isActive = true
        
        programInfoButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        programInfoButton.topAnchor.constraint(equalTo: enrollButton.bottomAnchor, constant: 25).isActive = true
        programInfoButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.65).isActive = true
        programInfoButton.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6).isActive = true
        
        locationsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        locationsButton.topAnchor.constraint(equalTo: programInfoButton.bottomAnchor, constant: 25).isActive = true
        locationsButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.65).isActive = true
        locationsButton.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6).isActive = true
        
        classScheduleButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        classScheduleButton.topAnchor.constraint(equalTo: locationsButton.bottomAnchor, constant: 25).isActive = true
        classScheduleButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.65).isActive = true
        classScheduleButton.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6).isActive = true
        
        label4.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label4.topAnchor.constraint(equalTo: classScheduleButton.bottomAnchor, constant: 25).isActive = true
        label4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.28).isActive = true
        label4.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        videoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        videoView.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 15).isActive = true
        videoView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        videoView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.35).isActive = true
        getVideo(videoCode: "yWo_076lOhg")
        
        seeProgramInfoButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        seeProgramInfoButton.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 15).isActive = true
        seeProgramInfoButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.75).isActive = true
        seeProgramInfoButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.095).isActive
         = true
        
        label5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label5.topAnchor.constraint(equalTo: seeProgramInfoButton.bottomAnchor, constant: 25).isActive = true
        label5.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label5.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        label5.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 16)
        
        image1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        image1.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 15).isActive = true
        image1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        image1.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.32).isActive = true
        
        label6.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label6.topAnchor.constraint(equalTo: image1.bottomAnchor, constant: 15).isActive = true
        label6.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label6.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        label6.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 18)
        
        label7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 25).isActive = true
        label7.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label7.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.085).isActive = true
        label7.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 18)
        
        label8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label8.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 15).isActive = true
        label8.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label8.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        label8.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 18)
        
        label9.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 15).isActive = true
        label9.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label9.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        label9.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 18)
        
        label10.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: 15).isActive = true
        label10.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label10.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.265).isActive = true
        label10.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 18)
        
        label11.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label11.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: 25).isActive = true
        label11.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label11.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.085).isActive = true
        label11.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 18)
        
    }
    
    @objc func handleEnroll() {
        previousVC = "HomeVC"
        UserDefaults.standard.set("HomeVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(EnrollViewController(), animated: true) {}
    }
    
    @objc func handleProgramInfo() {
        previousVC = "HomeVC"
        UserDefaults.standard.set("HomeVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(ProgramInfoViewController(), animated: true) {}
    }
    
    @objc func handleLocations() {
        previousVC = "HomeVC"
        UserDefaults.standard.set("HomeVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(LocationsViewController(), animated: true) {}
    }
    
    @objc func handleClassSchedule() {
        previousVC = "HomeVC"
        UserDefaults.standard.set("HomeVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(ClassScheduleViewController(), animated: true) {}
    }
    
    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true) {}
    }

    func getVideo(videoCode: String ) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        videoView.loadRequest(URLRequest(url: url!))
    }
    
}


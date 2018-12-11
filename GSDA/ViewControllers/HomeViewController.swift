//
//  HomeViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/10/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {

    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.clear
        sv.alpha = 1
        sv.layer.cornerRadius = 15
        sv.layer.masksToBounds  = true
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
        label.textColor = UIColor.white
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
        label.textColor = UIColor.white
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
        label.textColor = UIColor.white
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
        
        return button
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        
        label.text = "We can train you in 12 weeks, with 78 hours of lecture and lab, plus a 50 hour internship with a practicing dentist. After you graduate you’ll have the skills to get a job immediately."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.white
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
    
    let videoView: UIView = {
       let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.layer.masksToBounds  = true
        
        return view
    }()
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    let videoString: String? = Bundle.main.path(forResource: "Video1", ofType: "mp4")
    
    let seeProgramInfoButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("See Program Information", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleSeeProgramInfo), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "HomeViewController"
        
        scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 4305)
        
        getVideo()
        
        setupView()
        setupScrollView()
        
    }
    
    func setupView() {
        
        self.view.addSubview(scrollView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9).isActive = true
        
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
     
        // https://youtu.be/yWo_076lOhg
        videoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        videoView.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 15).isActive = true
        videoView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        videoView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.35).isActive = true
        
        seeProgramInfoButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        seeProgramInfoButton.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 15).isActive = true
        seeProgramInfoButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.75).isActive = true
        seeProgramInfoButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.095).isActive
         = true
        
    }
    
    func getVideo() {
        if let localURL = videoString {
            let localVideoURL = URL(fileURLWithPath: localURL)
            
            player = AVPlayer(url: localVideoURL as URL)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            playerLayer.frame = videoView.bounds
            player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
            videoView.layer.addSublayer(playerLayer)
            videoView.transform = CGAffineTransform(scaleX: 1, y: 1)
            player.play()
            
        }
    }
    
    @objc func handleEnroll() {
        
    }
    
    @objc func handleProgramInfo() {
        
    }
    
    @objc func handleLocations() {
        
    }
    
    @objc func handleClassSchedule() {
        
    }
    
    @objc func handleSeeProgramInfo() {
        
    }

}

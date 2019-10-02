//
//  LocationsViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/14/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController {
    
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
    
    lazy var backButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.isHidden = true
        return button
    }()
    
    let roswellImg: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "RoswellImg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let roswellView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 16, g: 80, b: 145)
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    let roswellLbl: UILabel = {
        let label = UILabel()
        
        label.text = "11685 Alpharetta Highway, Suite 105, Roswell, Georgia 30076"
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
    
    let roswellButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("View", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleRoswell), for: .touchUpInside)
        
        return button
    }()
    
    let kennesawImg: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "KennesawImg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let kennesawView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 16, g: 80, b: 145)
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    let kennesawLbl: UILabel = {
        let label = UILabel()
        
        label.text = "1610 Ridenour Boulevard Northwest, Suite 103, Kennesaw, Georgia 30152"
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
    
    let kennesawButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("View", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleKennesaw), for: .touchUpInside)
        
        return button
    }()
    
    let woodstockView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 16, g: 80, b: 145)
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        //view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleWoodstock)))
        // ^ this is a good trick to remeber.
        
        return view
    }()
    
    let woodstockLbl1: UILabel = {
        let label = UILabel()
        
        label.text = "GSDA — Woodstock"
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
    
    let woodstockLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "9020 GA-92, Suite 120, Woodstock, Georgia 30189"
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
    
    let woodstockButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("View", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleWoodstock), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "LOCATIONS"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 650)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 745)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 795)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 745)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 800)
        }
        
        setupView()
        setupScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        self.view.addSubview(backButton)
        
        
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
    }
    
    func setupScrollView() {
        
        
        self.scrollView.addSubview(roswellImg)
        self.scrollView.addSubview(roswellView)
        self.scrollView.addSubview(roswellLbl)
        self.roswellView.addSubview(roswellButton)
        
        roswellImg.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        roswellImg.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        roswellImg.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        roswellImg.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        
        roswellView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        roswellView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        roswellView.topAnchor.constraint(equalTo: roswellImg.bottomAnchor).isActive = true
        roswellView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        roswellLbl.centerXAnchor.constraint(equalTo: roswellView.centerXAnchor).isActive = true
        roswellLbl.topAnchor.constraint(equalTo: roswellView.topAnchor, constant: 0).isActive = true
        roswellLbl.widthAnchor.constraint(equalTo: roswellView.widthAnchor, multiplier: 0.95).isActive = true
        roswellLbl.heightAnchor.constraint(equalTo: roswellView.heightAnchor, multiplier: 0.4).isActive = true
        roswellLbl.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 25)
        
        roswellButton.widthAnchor.constraint(equalTo: roswellView.widthAnchor, multiplier: 0.75).isActive = true
        roswellButton.heightAnchor.constraint(equalTo: roswellView.heightAnchor, multiplier: 0.25).isActive = true
        roswellButton.centerXAnchor.constraint(equalTo: roswellView.centerXAnchor).isActive = true
        roswellButton.bottomAnchor.constraint(equalTo: roswellView.bottomAnchor, constant: -15).isActive = true
        
        self.scrollView.addSubview(kennesawImg)
        self.scrollView.addSubview(kennesawView)
        self.kennesawView.addSubview(kennesawLbl)
        self.kennesawView.addSubview(kennesawButton)
        
        kennesawImg.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        kennesawImg.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        kennesawImg.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        kennesawImg.topAnchor.constraint(equalTo: roswellView.bottomAnchor, constant: 25).isActive = true
        
        kennesawView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        kennesawView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        kennesawView.topAnchor.constraint(equalTo: kennesawImg.bottomAnchor).isActive = true
        kennesawView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        kennesawLbl.centerXAnchor.constraint(equalTo: kennesawView.centerXAnchor).isActive = true
        kennesawLbl.topAnchor.constraint(equalTo: kennesawView.topAnchor, constant: 0).isActive = true
        kennesawLbl.widthAnchor.constraint(equalTo: kennesawView.widthAnchor, multiplier: 0.95).isActive = true
        kennesawLbl.heightAnchor.constraint(equalTo: kennesawView.heightAnchor, multiplier: 0.4).isActive = true
        kennesawLbl.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 25)
        
        kennesawButton.widthAnchor.constraint(equalTo: kennesawView.widthAnchor, multiplier: 0.75).isActive = true
        kennesawButton.heightAnchor.constraint(equalTo: kennesawView.heightAnchor, multiplier: 0.25).isActive = true
        kennesawButton.centerXAnchor.constraint(equalTo: kennesawView.centerXAnchor).isActive = true
        kennesawButton.bottomAnchor.constraint(equalTo: kennesawView.bottomAnchor, constant: -15).isActive = true
        
        scrollView.addSubview(woodstockView)
        woodstockView.addSubview(woodstockLbl1)
        woodstockView.addSubview(woodstockLbl2)
        woodstockView.addSubview(woodstockButton)
        
        woodstockView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        woodstockView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        woodstockView.topAnchor.constraint(equalTo: kennesawView.bottomAnchor, constant: 25).isActive = true
        woodstockView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
         
        woodstockLbl1.centerXAnchor.constraint(equalTo: woodstockView.centerXAnchor).isActive = true
        woodstockLbl1.topAnchor.constraint(equalTo: woodstockView.topAnchor, constant: 0).isActive = true
        woodstockLbl1.widthAnchor.constraint(equalTo: woodstockView.widthAnchor, multiplier: 0.95).isActive = true
        woodstockLbl1.heightAnchor.constraint(equalTo: woodstockView.heightAnchor, multiplier: 0.2).isActive = true
        woodstockLbl1.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 25)
        
        woodstockLbl2.centerXAnchor.constraint(equalTo: woodstockView.centerXAnchor).isActive = true
        woodstockLbl2.topAnchor.constraint(equalTo: woodstockLbl1.bottomAnchor, constant: 0).isActive = true
        woodstockLbl2.widthAnchor.constraint(equalTo: woodstockView.widthAnchor, multiplier: 0.95).isActive = true
        woodstockLbl2.heightAnchor.constraint(equalTo: woodstockView.heightAnchor, multiplier: 0.4).isActive = true
        woodstockLbl2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 25)
        
        woodstockButton.widthAnchor.constraint(equalTo: woodstockView.widthAnchor, multiplier: 0.75).isActive = true
        woodstockButton.heightAnchor.constraint(equalTo: woodstockView.heightAnchor, multiplier: 0.25).isActive = true
        woodstockButton.centerXAnchor.constraint(equalTo: woodstockView.centerXAnchor).isActive = true
        woodstockButton.bottomAnchor.constraint(equalTo: woodstockView.bottomAnchor, constant: -5).isActive = true
        
    }
    
    @objc func handleRoswell() {
        navigationController?.pushViewController(RoswellLocationViewController(), animated: true)
    }
    
    @objc func handleKennesaw() {
        navigationController?.pushViewController(KennesawLocationViewController(), animated: true)
    }
    
    @objc func handleWoodstock() {
        navigationController?.pushViewController(WoodstockLocationViewController(), animated: true)
    }
}

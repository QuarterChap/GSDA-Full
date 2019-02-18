//
//  CourseMaterialViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/28/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class CourseMaterialViewController: UIViewController {

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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Course Material"
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
    
    lazy var gsdaCatalogButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("GSDA Catalog", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handleGSDACatalog), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE1Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE1", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE1), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE2Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE2", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE2), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE3Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE3", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE3), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE4Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE4", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE4), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE5Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE5", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE5), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE6Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE6", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE6), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE7Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE7", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE7), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE8Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE8", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE8), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE9Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE9", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE9), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE10Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE10", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE10), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE11Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE11", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE11), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE12Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE12", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE12), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE13Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE13", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE13), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE14Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE14", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE14), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE15Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE15", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE15), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE16Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE16", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE16), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE17Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE17", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE17), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE18Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE18", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE18), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE19Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE19", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE19), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE20Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE20", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE20), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE22Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE22", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE22), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "CourseMaterialViewController"
       
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2.55)
        
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
        self.scrollView.addSubview(titleLabel)
        self.scrollView.addSubview(gsdaCatalogButton)
        self.scrollView.addSubview(PPLE1Button)
        self.scrollView.addSubview(PPLE2Button)
        self.scrollView.addSubview(PPLE3Button)
        self.scrollView.addSubview(PPLE4Button)
        self.scrollView.addSubview(PPLE5Button)
        self.scrollView.addSubview(PPLE6Button)
        self.scrollView.addSubview(PPLE7Button)
        self.scrollView.addSubview(PPLE8Button)
        self.scrollView.addSubview(PPLE9Button)
        self.scrollView.addSubview(PPLE10Button)
        self.scrollView.addSubview(PPLE11Button)
        self.scrollView.addSubview(PPLE12Button)
        self.scrollView.addSubview(PPLE13Button)
        self.scrollView.addSubview(PPLE14Button)
        self.scrollView.addSubview(PPLE15Button)
        self.scrollView.addSubview(PPLE16Button)
        self.scrollView.addSubview(PPLE17Button)
        self.scrollView.addSubview(PPLE18Button)
        self.scrollView.addSubview(PPLE19Button)
        self.scrollView.addSubview(PPLE20Button)
        self.scrollView.addSubview(PPLE22Button)
        
        titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        gsdaCatalogButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        gsdaCatalogButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.frame.height * 0.075).isActive = true
        gsdaCatalogButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        gsdaCatalogButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        gsdaCatalogButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE1Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE1Button.topAnchor.constraint(equalTo: gsdaCatalogButton.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE1Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE1Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE1Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE2Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE2Button.topAnchor.constraint(equalTo: PPLE1Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE2Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE2Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE2Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE3Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE3Button.topAnchor.constraint(equalTo: PPLE2Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE3Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE3Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE3Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE4Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE4Button.topAnchor.constraint(equalTo: PPLE3Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE4Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE4Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE4Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE5Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE5Button.topAnchor.constraint(equalTo: PPLE4Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE5Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE5Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE5Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE6Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE6Button.topAnchor.constraint(equalTo: PPLE5Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE6Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE6Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE6Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE7Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE7Button.topAnchor.constraint(equalTo: PPLE6Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE7Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE7Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE7Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE8Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE8Button.topAnchor.constraint(equalTo: PPLE7Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE8Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE8Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE8Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE9Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE9Button.topAnchor.constraint(equalTo: PPLE8Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE9Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE9Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE9Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE10Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE10Button.topAnchor.constraint(equalTo: PPLE9Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE10Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE10Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE10Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE11Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE11Button.topAnchor.constraint(equalTo: PPLE10Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE11Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE11Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE11Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE12Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE12Button.topAnchor.constraint(equalTo: PPLE11Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE12Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE12Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE12Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE13Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE13Button.topAnchor.constraint(equalTo: PPLE12Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE13Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE13Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE13Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE14Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE14Button.topAnchor.constraint(equalTo: PPLE13Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE14Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE14Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE14Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE15Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE15Button.topAnchor.constraint(equalTo: PPLE14Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE15Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE15Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE15Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE16Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE16Button.topAnchor.constraint(equalTo: PPLE15Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE16Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE16Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE16Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE17Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE17Button.topAnchor.constraint(equalTo: PPLE16Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE17Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE17Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE17Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE18Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE18Button.topAnchor.constraint(equalTo: PPLE17Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE18Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE18Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE18Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE19Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE19Button.topAnchor.constraint(equalTo: PPLE18Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE19Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE19Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE19Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE20Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE20Button.topAnchor.constraint(equalTo: PPLE19Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE20Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE20Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE20Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        PPLE22Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        PPLE22Button.topAnchor.constraint(equalTo: PPLE20Button.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        PPLE22Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        PPLE22Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        PPLE22Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
    }
    
    @objc func handleMainMenu() {
        self.present(MainMenuViewController(), animated: true) {}
    }
    
    @objc func handleGSDACatalog() {
        self.present(GSDACatalogViewController(), animated: true) {}
    }
    
    @objc func handlePPLE1() {
        self.present(PPLE1ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE2() {
        self.present(PPLE2ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE3() {
        self.present(PPLE3ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE4() {
        self.present(PPLE4ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE5() {
        self.present(PPLE5ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE6() {
        self.present(PPLE6ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE7() {
        self.present(PPLE7ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE8() {
        self.present(PPLE8ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE9() {
        self.present(PPLE9ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE10() {
        self.present(PPLE10ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE11() {
        self.present(PPLE11ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE12() {
        self.present(PPLE12ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE13() {
        self.present(PPLE13ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE14() {
        self.present(PPLE14ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE15() {
        self.present(PPLE15ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE16() {
        self.present(PPLE16ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE17() {
        self.present(PPLE17ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE18() {
        self.present(PPLE18ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE19() {
        self.present(PPLE19ViewController(), animated: true) {}
    }
    
    @objc func handlePPLE20() {
        self.present(PPLE20ViewController(), animated: true) {}
    }

    @objc func handlePPLE22() {
        self.present(PPLE22ViewController(), animated: true) {}
    }

}

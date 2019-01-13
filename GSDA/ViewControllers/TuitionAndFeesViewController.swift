//
//  TuitionAndFeesViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/3/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class TuitionAndFeesViewController: UIViewController {

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
    
    lazy var backButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        
        label.text = "Tuition & Fees"
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
        
        label.text = "All students enroll for a complete program and pay tuition for the complete program prior to entrance unless other arrangements have been made. Tuition includes books and supplies."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        
        label.text = "Course - Dental Assisting"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        
        label.text = "Tuition - $3,050"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label5: UILabel = {
        let label = UILabel()
        
        label.text = "Application Fee - $100"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label6: UILabel = {
        let label = UILabel()
        
        label.text = "Deposit - $100"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label7: UILabel = {
        let label = UILabel()
        
        label.text = "Books/Supplies - $150"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label8: UILabel = {
        let label = UILabel()
        
        label.text = "Total - $3,400"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label9: UILabel = {
        let label = UILabel()
        
        label.text = "Arrangements may be made for students to pay tuition on a monthly basis. Tuition must be paid either prior to entrance or prior to the month in which it is due. The application fee and deposit fee must accompany the enrollment agreement to secure a space in the program. Application fee/Deposit fee will be refunded if student withdrawals two weeks prior to the start of class. The total amount of $3,400.00 must be paid prior to issuance of certificate upon completion of the internship and course. Cancellation and refund policy will follow the same format as discussed in the Catalog and Enrollment Agreement. A late fee of 5% is charged for late payments."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "TuitionAndFeesViewController"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 800)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 925)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1025)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1075)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1200)
        }
        
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        self.view.addSubview(mainMenuButton)
        
        if previousVC == "ProgramInfoVC" {
            self.view.addSubview(backButton)
            
            mainMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
            mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
            
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
            backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        } else {
            mainMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
            mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        }
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: mainMenuButton.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
    }
    
    func setupScrollView() {
        scrollView.addSubview(label1)
        scrollView.addSubview(label2)
        scrollView.addSubview(label3)
        scrollView.addSubview(label4)
        scrollView.addSubview(label5)
        scrollView.addSubview(label6)
        scrollView.addSubview(label7)
        scrollView.addSubview(label8)
        scrollView.addSubview(label9)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 25).isActive = true
        label2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.175).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10).isActive = true
        label3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label3.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label4.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 10).isActive = true
        label4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label4.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 10).isActive = true
        label5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label5.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label5.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label6.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 10).isActive = true
        label6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label6.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label6.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 10).isActive = true
        label7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label7.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label7.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label8.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 10).isActive = true
        label8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label8.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label8.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 21)
        
        label9.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 10).isActive = true
        label9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label9.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.625).isActive = true
        label9.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
    }

    @objc func handleBack() {
        self.present(ProgramInfoViewController(), animated: true)
    }
    
    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true)
    }
    
}

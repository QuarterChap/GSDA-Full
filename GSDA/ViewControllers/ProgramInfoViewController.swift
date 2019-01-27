//
//  ProgramInfoViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/12/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class ProgramInfoViewController: UIViewController {

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
        
        label.text = "Program Information"
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
    
    let image1: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "12weeksImg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let image2: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "78hoursImg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let image3: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "50hoursImg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        
        label.text = "YOU CAN BECOME A DENTAL ASSISTANT"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 158, g: 170, b: 50)
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
    
    let label3: UILabel = {
        let label = UILabel()
        
        label.text = "Georgia School of Dental Assisting is a one of a kind opportunity located in Roswell and Kennesaw GA. This unique program will give you the knowledge and skills making you immediately employable. Nowhere else in the area will you receive better hands-on training in a small classroom setting. Dental Assisting is a fun and rewarding career that you could be fully qualified for in three short months."
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
    
    let label4: UILabel = {
        let label = UILabel()
        
        label.text = "After some experience as a Dental Assistant, graduates become office managers, Dental Assistant instructors, dental product sales representatives, and even move on to dental hygiene, which is highly competitive. For many, this entry level position serves as a stepping stone to being highly skilled and to higher paying jobs. Only twelve students are accepted per class. Hurry and change your life now!"
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
    
    let label5: UILabel = {
        let label = UILabel()
        
        label.text = "🏛 Overview"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 158, g: 170, b: 50)
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
    
    let image4: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "DenturesImg")
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
        
        label.text = "LECTURE    Introduction to the Profession"
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
    
    let label7: UILabel = {
        let label = UILabel()
        
        label.text = "LECTURE    Ethical & Legal Issues in Dentistry"
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
    
    let label8: UILabel = {
        let label = UILabel()
        
        label.text = "LAB    Dental Chair & Infection Control (PPE)"
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
    
    let label9: UILabel = {
        let label = UILabel()
        
        label.text = "LAB    Inf. Cont. — Maintaining the Operating Field"
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
    
    let label10: UILabel = {
        let label = UILabel()
        
        label.text = "LAB    Inf. Cont. — Treatment Preparation & Clean-up"
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
    
    lazy var viewCurriculumButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("View Curriculum", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleViewCurriculum), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    let tuitionAndFeesButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "tuitionFeesPicImg"), for: UIControlState.normal)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleTuitionAndFees), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let admissionRequirmentsButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "admissionRequirmentsPicImg"), for: UIControlState.normal)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleAdmissionRequirments), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let financialAidButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "financialAidPicImg"), for: UIControlState.normal)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleFinancialAid), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "ProgramInfoViewController"
        
        print(previousVC as! String)
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 2925)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3350)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3650)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3625)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3950)
        }
        
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        
        self.view.addSubview(scrollView)
        self.view.addSubview(mainMenuButton)
        self.view.addSubview(backButton)
        
        mainMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: mainMenuButton.topAnchor, constant: 00).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
        
    }
    
    func setupScrollView() {
        
        self.scrollView.addSubview(label1)
        self.scrollView.addSubview(image1)
        self.scrollView.addSubview(image2)
        self.scrollView.addSubview(image3)
        self.scrollView.addSubview(label2)
        self.scrollView.addSubview(label3)
        self.scrollView.addSubview(label4)
        self.scrollView.addSubview(label5)
        self.scrollView.addSubview(image4)
        self.scrollView.addSubview(label6)
        self.scrollView.addSubview(label7)
        self.scrollView.addSubview(label8)
        self.scrollView.addSubview(label9)
        self.scrollView.addSubview(label10)
        self.scrollView.addSubview(viewCurriculumButton)
        self.scrollView.addSubview(tuitionAndFeesButton)
        self.scrollView.addSubview(admissionRequirmentsButton)
        self.scrollView.addSubview(financialAidButton)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.165).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 9)
        
        image1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        image1.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        image1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        image1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 50).isActive = true
        
        image2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        image2.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        image2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        image2.topAnchor.constraint(equalTo: image1.bottomAnchor, constant: 25).isActive = true
        
        image3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        image3.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        image3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        image3.topAnchor.constraint(equalTo: image2.bottomAnchor, constant: 25).isActive = true
        
        label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: image3.bottomAnchor, constant: 15).isActive = true
        label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
        
        label3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15).isActive = true
        label3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55).isActive = true
        label3.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label4.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 15).isActive = true
        label4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        label4.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 50).isActive = true
        label5.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label5.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        label5.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 8)
        
        image4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        image4.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        image4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image4.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 25).isActive = true
        
        label6.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label6.topAnchor.constraint(equalTo: image4.bottomAnchor, constant: 15).isActive = true
        label6.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label6.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        label6.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 10).isActive = true
        label7.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label7.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        label7.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label8.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 10).isActive = true
        label8.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label8.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        label8.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label9.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 10).isActive = true
        label9.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label9.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        label9.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label10.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: 10).isActive = true
        label10.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label10.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        label10.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        viewCurriculumButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        viewCurriculumButton.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: 15).isActive = true
        viewCurriculumButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        viewCurriculumButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        
        tuitionAndFeesButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        tuitionAndFeesButton.topAnchor.constraint(equalTo: viewCurriculumButton.bottomAnchor, constant: 25).isActive = true
        tuitionAndFeesButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        tuitionAndFeesButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        
        admissionRequirmentsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        admissionRequirmentsButton.topAnchor.constraint(equalTo: tuitionAndFeesButton.bottomAnchor, constant: 25).isActive = true
        admissionRequirmentsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        admissionRequirmentsButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        
        financialAidButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        financialAidButton.topAnchor.constraint(equalTo: admissionRequirmentsButton.bottomAnchor, constant: 25).isActive = true
        financialAidButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        financialAidButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        
    }
    
    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true)
    }
    
    @objc func handleViewCurriculum() {
        previousVC = "ProgramInfoVC"
        UserDefaults.standard.set("ProgramInfoVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(CurriculumViewController(), animated: true)
    }
    @objc func handleTuitionAndFees() {
        previousVC = "ProgramInfoVC"
        UserDefaults.standard.set("ProgramInfoVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(TuitionAndFeesViewController(), animated: true)
    }
    @objc func handleAdmissionRequirments() {
        previousVC = "ProgramInfoVC"
        UserDefaults.standard.set("ProgramInfoVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(AdmissionRequirementsViewController(), animated: true)
    }
    @objc func handleFinancialAid() {
        
    }
    @objc func handleBack() {
        self.present(HomeViewController(), animated: true)
    }

}

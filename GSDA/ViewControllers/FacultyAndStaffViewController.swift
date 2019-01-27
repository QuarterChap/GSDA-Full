//
//  FacultyAndStaffViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/27/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class FacultyAndStaffViewController: UIViewController {

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
        
        label.text = "Faculty & Staff"
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
        
        label.text = "Morgan Younce"
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
    
    let label3: UILabel = {
        let label = UILabel()
        
        label.text = "Operations Manager"
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
        
        label.text = "Ms. Younce graduated from Cornerstone Preparatory Academy in 2010. She took classes at Georgia College & State University in Milledgeville, before moving back to the Atlanta area and becoming a dental assistant. She recently worked at 1st Choice Dental Care as an assistant at the Kennesaw location, and has experience in front desk operations and insurance. She is currently a marketing coordinator for 1st Choice Dental Care."
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
        
        imageView.image = UIImage(named: "morganyounce")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let label5: UILabel = {
        let label = UILabel()
        
        label.text = "Dusti Reed"
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
    
    let label6: UILabel = {
        let label = UILabel()
        
        label.text = "Lead Instructor-Kennesaw/Woodstock"
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
        
        label.text = "Mrs. Reed graduated from Hawes Career Institute in 1995. In 2003 she became a certified dental assistant and then in 2004 she passed the Ohio boards to become expanded functions dental assistant. She has been a dental assistant for 20 years with the last three in Georgia. She is currently the lead dental assistant at 1st Choice Dental Care in Kennesaw, GA."
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
    
    let image2: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "dustireed")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let label8: UILabel = {
        let label = UILabel()
        
        label.text = "Sam Richter"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 124, g: 128, b: 49)
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
        
        label.text = "Lead Instructor-Roswell"
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
        
        label.text = "Mr. Richter graduated from High School in 2003. Upon graduating he started his career in the dental industry as a mobile manager for Help a Child Smile. Shortly after he moved into Dental Assisting where he has been for the last eight years. He is a certified expanded duty dental assistant with experience in front desk operations and insurance collection. He graduated from Fortis College in 2013 with an Associate’s degree in Dental Hygiene. He is currently a Dental Hygienist with Dent1st"
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
    
    let image3: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "samrichter")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let label11: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. Igor Reizenson"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 124, g: 128, b: 49)
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
    
    let label12: UILabel = {
        let label = UILabel()
        
        label.text = "DDS, Director"
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
    
    let label13: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. Reizenson received his DDS from the State University of New York at Buffalo School of Dental Medicine in 2001. He then advanced to the prestigious General Practice Residency Program at Veterans Hospital of Western New York. Upon completion, Dr. Reizenson relocated to Atlanta, Georgia and worked for a mobile dentistry group called Help A Child Smile that primarily cares for underserved children all across the state of Georgia. As one of the owners of iSmile, a technology forward dental office, he is a routine volunteer for Give Kids A Smile Day. Dr. Reizenson is certified in the use of Cerec technology for single visit all ceramic restorations, as well as certified in placing and restoring dental implants. In 2007 Dr. Reizenson was recognized by the History Channel’s “Modern Marvels” as one of America’s top 25 inventors of the year for a patented oral hygiene device called ClearSmile. He is the founder and CEO of ClearSmile LLC. Dr. Reizenson is a long standing member of the American Dental Association, as well as the Georgia Dental Association."
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
    
    let label14: UILabel = {
        let label = UILabel()
        
        label.text = "DR. ALLA ALPERT"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 124, g: 128, b: 49)
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
    
    let label15: UILabel = {
        let label = UILabel()
        
        label.text = "Clinical Instructor"
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
    
    let label16: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. Alla Alpert graduated from State University of New York at Buffalo School of Dental Medicine in 2002, and completed a General Practice Residency at Erie County Medical Hospital. During the residency program Dr. Alpert received extensive training in Oral Surgery, trauma and emergency care, endodontics and completed an Esthetic Dentistry Continuum. Following graduation, from 2003-2006, Dr. Alpert moved to Georgia and worked in a family practice as an associate dentist. In 2006 she opened a family practice in Roswell, GA. Since moving to Georgia, Dr. Alpert has completed hundreds of hours of continuous education in clinical dentistry and practice management. She has received Level I and Level II training in Invisalign, Basic and Advanced Cerec training, LVI endodontic root camp training, Practice Management by Statistics training along with many other courses at Hinman and other facilities. Dr. Alpert volunteers at Special Smiles Olympics and takes on pro-bono cases to help out in the community. Dr. Alpert has trained many employees at her office and has created multiple study and work manual for various positions in the office and has tremendous understanding of the skills that a dental assistant needs to possess."
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
    
    let label17: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. Kelly Vaughn"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 124, g: 128, b: 49)
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
    
    let label18: UILabel = {
        let label = UILabel()
        
        label.text = "Clinical Instructor"
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
    
    let label19: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. Vaughn received her Bachelor of Science degree in Cell Biology from The University of Tennessee, then went on to achieve her DDS degree from the University of Tennessee in Memphis. She is a member of the International Team of Implantology study group and remains up to date with many other continuing education classes. She is currently the owner of 1st Choice Dental, which has 3 locations in the Atlanta metro area."
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "FacultyAndStaffViewController"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3650)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 4225)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 4575)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 5050)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 5450)
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
        scrollView.bottomAnchor.constraint(equalTo: mainMenuButton.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
    }
    
    func setupScrollView() {
        self.scrollView.addSubview(label1)
        self.scrollView.addSubview(label2)
        self.scrollView.addSubview(label3)
        self.scrollView.addSubview(label4)
        self.scrollView.addSubview(image1)
        self.scrollView.addSubview(label5)
        self.scrollView.addSubview(label6)
        self.scrollView.addSubview(label7)
        self.scrollView.addSubview(image2)
        self.scrollView.addSubview(label8)
        self.scrollView.addSubview(label9)
        self.scrollView.addSubview(label10)
        self.scrollView.addSubview(image3)
        self.scrollView.addSubview(label11)
        self.scrollView.addSubview(label12)
        self.scrollView.addSubview(label13)
        self.scrollView.addSubview(label14)
        self.scrollView.addSubview(label15)
        self.scrollView.addSubview(label16)
        self.scrollView.addSubview(label17)
        self.scrollView.addSubview(label18)
        self.scrollView.addSubview(label19)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 50).isActive = true
        label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
        
        label3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15).isActive = true
        label3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        label3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label3.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label4.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 15).isActive = true
        label4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        label4.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        image1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        image1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.425).isActive = true
        image1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image1.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 15).isActive = true
        
        label5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label5.topAnchor.constraint(equalTo: image1.bottomAnchor, constant: 50).isActive = true
        label5.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        label5.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label5.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
        
        label6.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 15).isActive = true
        label6.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label6.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        label6.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 15).isActive = true
        label7.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label7.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        label7.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        image2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        image2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.425).isActive = true
        image2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image2.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 15).isActive = true
        
        label8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label8.topAnchor.constraint(equalTo: image2.bottomAnchor, constant: 50).isActive = true
        label8.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.55).isActive = true
        label8.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label8.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
        
        label9.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 15).isActive = true
        label9.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        label9.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label9.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label10.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: 15).isActive = true
        label10.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label10.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        label10.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
     
        image3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        image3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.425).isActive = true
        image3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image3.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: 15).isActive = true
        
        label11.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label11.topAnchor.constraint(equalTo: image3.bottomAnchor, constant: 50).isActive = true
        label11.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        label11.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label11.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
        
        label12.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label12.topAnchor.constraint(equalTo: label11.bottomAnchor, constant: 15).isActive = true
        label12.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45).isActive = true
        label12.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label12.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label13.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label13.topAnchor.constraint(equalTo: label12.bottomAnchor, constant: 15).isActive = true
        label13.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label13.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.85).isActive = true
        label13.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label14.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label14.topAnchor.constraint(equalTo: label13.bottomAnchor, constant: 50).isActive = true
        label14.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        label14.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label14.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
        
        label15.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label15.topAnchor.constraint(equalTo: label14.bottomAnchor, constant: 15).isActive = true
        label15.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        label15.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label15.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label16.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label16.topAnchor.constraint(equalTo: label15.bottomAnchor, constant: 15).isActive = true
        label16.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label16.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.1).isActive = true
        label16.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label17.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label17.topAnchor.constraint(equalTo: label16.bottomAnchor, constant: 50).isActive = true
        label17.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        label17.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label17.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
        
        label18.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label18.topAnchor.constraint(equalTo: label17.bottomAnchor, constant: 15).isActive = true
        label18.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        label18.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label18.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label19.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label19.topAnchor.constraint(equalTo: label18.bottomAnchor, constant: 15).isActive = true
        label19.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label19.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        label19.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
       
        // Do all constraint testing on the 5s
        // when reviewing the app go through with the 5s to make sure everything is up to par
        
    }

    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true)
    }
    
    @objc func handleBack() {
        self.present(AboutUsViewController(), animated: true)
    }
    
}

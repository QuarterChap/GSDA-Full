//
//  EnrollViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/3/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class EnrollViewController: UIViewController {

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
        
        label.text = "Enroll"
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
        
        label.text = "❶ Terms & Conditions and pay application fee."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 124, g: 128, b: 49)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        
        label.text = "❷ Pick a date & location and fill out application."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        
        label.text = "❸ All done!"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label5: UILabel = {
        let label = UILabel()
        
        label.text = "Tuition"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 124, g: 128, b: 49)
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
        
        label.text = "The total cost for the Dental Assisting program:"
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
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label8: UILabel = {
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
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label9: UILabel = {
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
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label10: UILabel = {
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
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label11: UILabel = {
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
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label12: UILabel = {
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
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label13: UILabel = {
        let label = UILabel()
        
        label.text = "The application fee and deposit fee must accompany the enrollment agreement to secure a space in the program. Application fee will be refunded if student withdrawals two weeks prior to the start of class.  The total amount of $3400.00 must be paid prior to issuance of certificate upon completion of the internship and course. Cancellation and refund policy will follow the same format as discussed in the Catalog and Enrollment Agreement."
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
        
        label.text = "Tuition Payments"
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
    
    let label15: UILabel = {
        let label = UILabel()
        
        label.text = "To assist students who are financially not capable of paying the full tuition up front, the school will offer easy interest free installment payment plans. These terms are available to all students who need assistance."
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
        
        label.text = "Option 1"
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
    
    let label17: UILabel = {
        let label = UILabel()
        
        label.text = "Application Fee/Deposit - $200"
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
    
    let label18: UILabel = {
        let label = UILabel()
        
        label.text = "1st Installment Upon Enrollment - $800"
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
        
        label.text = "2nd Installment on the 4th Week of Class - $800"
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
    
    let label20: UILabel = {
        let label = UILabel()
        
        label.text = "3rd Installment on the 8th Week of Class - $800"
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
    
    let label21: UILabel = {
        let label = UILabel()
        
        label.text = "4nd Installment on the 11th Week of Class - $800"
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
    
    let label22: UILabel = {
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
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label23: UILabel = {
        let label = UILabel()
        
        label.text = "Option 2: CareCredit"
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
    
    let label24: UILabel = {
        let label = UILabel()
        
        label.text = "We accept CareCredit. Please contact us for details."
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
    
    let label25: UILabel = {
        let label = UILabel()
        
        label.text = "Terms & Conditions"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 124, g: 128, b: 49)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label26: UILabel = {
        let label = UILabel()
        
        label.text = "Late Payments"
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
    
    let label27: UILabel = {
        let label = UILabel()
        
        label.text = "Installment payments not received 10 days after the due date shall incur a five percent (5%) penalty of the amount due"
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
    
    let label28: UILabel = {
        let label = UILabel()
        
        label.text = "Cancellation and Refund Policy"
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
    
    let label29: UILabel = {
        let label = UILabel()
        
        label.text = "Rejection"
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
    
    let label30: UILabel = {
        let label = UILabel()
        
        label.text = "An applicant rejected by the school is entitled to a refund of all monies paid."
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
    
    let label31: UILabel = {
        let label = UILabel()
        
        label.text = "Three-Day Cancellation"
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
    
    let label32: UILabel = {
        let label = UILabel()
        
        label.text = "The application fee will not be refunded if within two weeks of the course start date."
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
    
    let label33: UILabel = {
        let label = UILabel()
        
        label.text = "An applicant who provides written notice of cancellation within three days (excluding Saturday, Sunday and federal or state holidays) of signing an enrollment agreement is entitled to a refund of all monies paid. No later than 30 days of receiving the notice of cancellation, the school shall provide the 100% refund."
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
    
    let label34: UILabel = {
        let label = UILabel()
        
        label.text = "Other Cancellations"
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
    
    let label35: UILabel = {
        let label = UILabel()
        
        label.text = "An applicant requesting cancellation more than three days after signing an enrollment agreement and making an initial payment, but prior to entering the school, is entitled to a refund of all monies paid less the $100.00 application fee and $100 deposit fee."
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
    
    let label36: UILabel = {
        let label = UILabel()
        
        label.text = "Prodedure for Withdrawl/Withdrawl Date"
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
    
    let label37: UILabel = {
        let label = UILabel()
        
        label.text = "● A student choosing to withdraw from the school after the commencement of classes is to provide written notice to the Director of the school. The notice is to indicate the expected last date of attendance and be signed and dated by the student."
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
    
    let label38: UILabel = {
        let label = UILabel()
        
        label.text = "● For a student who is on authorized Leave of Absence, the withdraw date is the date the student was scheduled to return from the Leave and failed to do so."
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
    
    let label39: UILabel = {
        let label = UILabel()
        
        label.text = "● A student will be determined to be withdrawn from the institution if the student has not attended any class for 6 consecutive class hours."
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
    
    let label40: UILabel = {
        let label = UILabel()
        
        label.text = "● All refunds will be issued within 30 days of the determination of the withdrawal date (less the $100.00 application fee and $100 deposit fee)."
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
    
    let label41: UILabel = {
        let label = UILabel()
        
        label.text = "Tuition Charges/Refunds"
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
    
    let label42: UILabel = {
        let label = UILabel()
        
        label.text = "● Before the beginning of classes, the student is entitled to a refund of 100% of the tuition less $100.00 application fee and $100 deposit"
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
    
    let label43: UILabel = {
        let label = UILabel()
        
        label.text = "● After the commencement of classes, the tuition refund amount less $100 application fee and $100 deposit fee shall be determined as follows:"
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
    
    let label44: UILabel = {
        let label = UILabel()
        
        label.text = "● Refunds are determined based on the proration of tuition and percentage of program  completed at withdrawal, up until 50% of the program. The percentage of the clock hours attempted is determined by dividing the total number of clock hours elapsed from the student’s start date to the student’s last day of attendance, by the total number of clock hours in the program (less the $100.00 application/ $100 deposit fee)."
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
    
    let label45: UILabel = {
        let label = UILabel()
        
        label.text = "Privacy"
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
    
    let label46: UILabel = {
        let label = UILabel()
        
        label.text = "Georgia School of Dental Assisting is committed to protecting your privacy. We constantly review our systems and data to ensure the best possible service to our customers. Unauthorized activity against computer systems and data is against the law.  Georgia School of Dental Assisting will investigate any such activity and seek legal action against those responsible to recover any damages."
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
    
    let label47: UILabel = {
        let label = UILabel()
        
        label.text = "Books and Supplies"
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
    
    let label48: UILabel = {
        let label = UILabel()
        
        label.text = "There is no refund for any equipment, books and supplies received by the student."
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
    
    let label49: UILabel = {
        let label = UILabel()
        
        label.text = "Refunds will be issued within 30 days of the date of student notification, or date of school determination (withdrawn due to absences or other criteria as specified in the school catalog), or in the case of a student not returning from an authorized Leave of Absence (LOA), within 30 days of the date the student was scheduled to return from the LOA and did not return."
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
    
    let label50: UILabel = {
        let label = UILabel()
        
        label.text = "Special Cases"
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
    
    let label51: UILabel = {
        let label = UILabel()
        
        label.text = "In case of prolonged illness or accident, death in the family, or other circumstances that make it impractical for the student to complete the program, the school may make a settlement which is reasonable and fair (this language optional)."
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
    
    let label52: UILabel = {
        let label = UILabel()
        
        label.text = "Holder in Due Course Statement"
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
    
    let label53: UILabel = {
        let label = UILabel()
        
        label.text = "Any holder of this consumer credit contract is subject to all claims and defenses which the debtor could assert against the seller of goods or services obtained pursuant hereto or with the proceeds, hereof Recovery hereunder by the debtor shall not exceed amounts paid by the debtor (FTC Rule effective 5-14-76)."
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
    
    let label54: UILabel = {
        let label = UILabel()
        
        label.text = "Agreement & Deposit"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 124, g: 128, b: 49)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label55: UILabel = {
        let label = UILabel()
        
        label.text = "The Student Understands"
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
    
    let label56: UILabel = {
        let label = UILabel()
        
        label.text = "1. The school does not accept credit for previous education, training, work experience (experimental learning), or CLEP (if applicable)."
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
    
    let label57: UILabel = {
        let label = UILabel()
        
        label.text = "2. The School does not guarantee job placement to graduates upon program/course completion or upon graduation."
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
    
    let label58: UILabel = {
        let label = UILabel()
        
        label.text = "3. The School reserves the right to reschedule the program start date when the number of students scheduled is too small."
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
    
    let label59: UILabel = {
        let label = UILabel()
        
        label.text = "4. The School will not be responsible for any statement of policy or procedure that does not appear in the School catalog."
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
    
    let label60: UILabel = {
        let label = UILabel()
        
        label.text = "5. The School reserves the right to discontinue any students’ training for unsatisfactory progress, nonpayment of tuition or failure to abide by School rules."
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
    
    let label61: UILabel = {
        let label = UILabel()
        
        label.text = "6. Information concerning other Schools that may accept the School’s credits toward their programs can be obtained by contacting the office of the President. It should not be assumed that any programs described in the School catalog could be transferred to another institution. The School does not guarantee the transferability of credits to a college, university or institution. Any decision on the comparability, appropriateness and applicability of credits and whether they should be accepted is the decision of the receiving institution."
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
    
    let label62: UILabel = {
        let label = UILabel()
        
        label.text = "7. This document does not constitute a binding agreement until accepted in writing by all parties."
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
    
    let label63: UILabel = {
        let label = UILabel()
        
        label.text = "Student Acknowledgements"
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
    
    let label64: UILabel = {
        let label = UILabel()
        
        label.text = "1. I hereby acknowledge receipt of the GSDA’s school catalog dated January 1 2012, which contains information describing programs offered, and equipment/supplies provided. The school ‘s 2015/2016 catalog is included as a part of this enrollment agreement, and I acknowledge that I have received a copy of this catalog."
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
    
    let label65: UILabel = {
        let label = UILabel()
        
        label.text = "2. Also, I have carefully read and received an exact copy of this enrollment agreement."
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
    
    let label66: UILabel = {
        let label = UILabel()
        
        label.text = "3. I understand that the School may terminate my enrollment if I fail to comply with attendance, academic and financial requirement or if I disrupt the normal activities of the School. While enrolled in the School, I understand that I must maintain Satisfactory Academic Progress as described in the School catalog and that my financial obligation to the School must be paid in full before a certificate may be awarded."
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
    
    let label67: UILabel = {
        let label = UILabel()
        
        label.text = "4. I also understand that this institution does not guarantee job placement to graduates upon program/course completion or upon graduation."
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
    
    let label68: UILabel = {
        let label = UILabel()
        
        label.text = "Contract Acceptance"
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
    
    let label69: UILabel = {
        let label = UILabel()
        
        label.text = "I, the undersigned, have read and understand this agreement and acknowledge receipt of a copy. It is further understood and agreed that this agreement supersedes all prior or contemporaneous verbal or written agreements and may not be modified without the written agreement of the student and the School Official. I also understand that if I default upon this agreement I will be responsible for payment of any collection fees or attorney fees incurred by Georgia School of Dental Assisting, LLC."
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
    
    let label70: UILabel = {
        let label = UILabel()
        
        label.text = "My signature below signifies that I have read and understand all aspects of this agreement and do recognize my legal responsibilities in regard to this contract."
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
    
    lazy var payButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Pay $200 Registration Fee", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handlePay), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "EnrollViewController"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 6150)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 7075)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 7725)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 8400)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 9200)
        }
        
        setupView()
        setupScrollView()
        
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        self.view.addSubview(mainMenuButton)
        
        if previousVC == "HomeVC" {
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
        scrollView.addSubview(label10)
        scrollView.addSubview(label11)
        scrollView.addSubview(label12)
        scrollView.addSubview(label13)
        scrollView.addSubview(label14)
        scrollView.addSubview(label15)
        scrollView.addSubview(label16)
        scrollView.addSubview(label17)
        scrollView.addSubview(label18)
        scrollView.addSubview(label19)
        scrollView.addSubview(label20)
        scrollView.addSubview(label21)
        scrollView.addSubview(label22)
        scrollView.addSubview(label23)
        scrollView.addSubview(label24)
        scrollView.addSubview(label25)
        scrollView.addSubview(label26)
        scrollView.addSubview(label27)
        scrollView.addSubview(label28)
        scrollView.addSubview(label29)
        scrollView.addSubview(label30)
        scrollView.addSubview(label31)
        scrollView.addSubview(label32)
        scrollView.addSubview(label33)
        scrollView.addSubview(label34)
        scrollView.addSubview(label35)
        scrollView.addSubview(label36)
        scrollView.addSubview(label37)
        scrollView.addSubview(label38)
        scrollView.addSubview(label39)
        scrollView.addSubview(label40)
        scrollView.addSubview(label41)
        scrollView.addSubview(label42)
        scrollView.addSubview(label43)
        scrollView.addSubview(label44)
        scrollView.addSubview(label45)
        scrollView.addSubview(label46)
        scrollView.addSubview(label47)
        scrollView.addSubview(label48)
        scrollView.addSubview(label49)
        scrollView.addSubview(label50)
        scrollView.addSubview(label51)
        scrollView.addSubview(label52)
        scrollView.addSubview(label53)
        scrollView.addSubview(label54)
        scrollView.addSubview(label55)
        scrollView.addSubview(label56)
        scrollView.addSubview(label57)
        scrollView.addSubview(label58)
        scrollView.addSubview(label59)
        scrollView.addSubview(label60)
        scrollView.addSubview(label61)
        scrollView.addSubview(label62)
        scrollView.addSubview(label63)
        scrollView.addSubview(label64)
        scrollView.addSubview(label65)
        scrollView.addSubview(label66)
        scrollView.addSubview(label67)
        scrollView.addSubview(label68)
        scrollView.addSubview(label69)
        scrollView.addSubview(label70)
        scrollView.addSubview(payButton)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        label2.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 15).isActive = true
        label2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label3.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15).isActive = true
        label3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label3.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label4.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 15).isActive = true
        label4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label4.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 25).isActive = true
        label5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label5.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label5.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label6.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 25).isActive = true
        label6.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label6.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label6.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 10).isActive = true
        label7.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label7.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label7.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label8.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 10).isActive = true
        label8.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label8.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label8.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label9.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 10).isActive = true
        label9.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label9.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label9.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label10.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: 10).isActive = true
        label10.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label10.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label10.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label11.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label11.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: 10).isActive = true
        label11.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label11.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label11.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label12.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label12.topAnchor.constraint(equalTo: label11.bottomAnchor, constant: 10).isActive = true
        label12.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label12.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label12.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 21)
        
        label13.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label13.topAnchor.constraint(equalTo: label12.bottomAnchor, constant: 10).isActive = true
        label13.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label13.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.375).isActive = true
        label13.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label14.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label14.topAnchor.constraint(equalTo: label13.bottomAnchor, constant: 25).isActive = true
        label14.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label14.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label14.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label15.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label15.topAnchor.constraint(equalTo: label14.bottomAnchor, constant: 10).isActive = true
        label15.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label15.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        label15.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label16.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label16.topAnchor.constraint(equalTo: label15.bottomAnchor, constant: 25).isActive = true
        label16.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label16.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label16.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label17.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label17.topAnchor.constraint(equalTo: label16.bottomAnchor, constant: 10).isActive = true
        label17.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label17.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label17.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label18.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label18.topAnchor.constraint(equalTo: label17.bottomAnchor, constant: 10).isActive = true
        label18.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label18.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label18.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label19.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label19.topAnchor.constraint(equalTo: label18.bottomAnchor, constant: 10).isActive = true
        label19.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label19.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label19.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label20.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label20.topAnchor.constraint(equalTo: label19.bottomAnchor, constant: 10).isActive = true
        label20.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label20.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label20.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label21.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label21.topAnchor.constraint(equalTo: label20.bottomAnchor, constant: 10).isActive = true
        label21.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label21.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label21.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label22.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label22.topAnchor.constraint(equalTo: label21.bottomAnchor, constant: 10).isActive = true
        label22.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label22.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label22.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 21)
        
        label23.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label23.topAnchor.constraint(equalTo: label22.bottomAnchor, constant: 25).isActive = true
        label23.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label23.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label23.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label24.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label24.topAnchor.constraint(equalTo: label23.bottomAnchor, constant: 10).isActive = true
        label24.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label24.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label24.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        // previous green label "Terms and conditons is Lbl25"
        
        label25.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label25.topAnchor.constraint(equalTo: label24.bottomAnchor, constant: 25).isActive = true
        label25.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label25.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label25.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label26.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label26.topAnchor.constraint(equalTo: label25.bottomAnchor, constant: 25).isActive = true
        label26.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label26.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label26.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label27.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label27.topAnchor.constraint(equalTo: label26.bottomAnchor, constant: 10).isActive = true
        label27.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label27.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        label27.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label28.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label28.topAnchor.constraint(equalTo: label27.bottomAnchor, constant: 10).isActive = true
        label28.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label28.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label28.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label29.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label29.topAnchor.constraint(equalTo: label28.bottomAnchor, constant: 10).isActive = true
        label29.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label29.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label29.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label30.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label30.topAnchor.constraint(equalTo: label29.bottomAnchor, constant: 10).isActive = true
        label30.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label30.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label30.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label31.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label31.topAnchor.constraint(equalTo: label30.bottomAnchor, constant: 10).isActive = true
        label31.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label31.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label31.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label32.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label32.topAnchor.constraint(equalTo: label31.bottomAnchor, constant: 10).isActive = true
        label32.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label32.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        label32.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label33.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label33.topAnchor.constraint(equalTo: label32.bottomAnchor, constant: 10).isActive = true
        label33.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label33.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        label33.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label34.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label34.topAnchor.constraint(equalTo: label33.bottomAnchor, constant: 10).isActive = true
        label34.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label34.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label34.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label35.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label35.topAnchor.constraint(equalTo: label34.bottomAnchor, constant: 10).isActive = true
        label35.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label35.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label35.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label36.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label36.topAnchor.constraint(equalTo: label35.bottomAnchor, constant: 10).isActive = true
        label36.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label36.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label36.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label37.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label37.topAnchor.constraint(equalTo: label36.bottomAnchor, constant: 10).isActive = true
        label37.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label37.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label37.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label38.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label38.topAnchor.constraint(equalTo: label37.bottomAnchor, constant: 10).isActive = true
        label38.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label38.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label38.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label39.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label39.topAnchor.constraint(equalTo: label38.bottomAnchor, constant: 10).isActive = true
        label39.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label39.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label39.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label40.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label40.topAnchor.constraint(equalTo: label39.bottomAnchor, constant: 10).isActive = true
        label40.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label40.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label40.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label41.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label41.topAnchor.constraint(equalTo: label40.bottomAnchor, constant: 10).isActive = true
        label41.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label41.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label41.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label42.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label42.topAnchor.constraint(equalTo: label41.bottomAnchor, constant: 10).isActive = true
        label42.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label42.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label42.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label43.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label43.topAnchor.constraint(equalTo: label42.bottomAnchor, constant: 10).isActive = true
        label43.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label43.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label43.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label44.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label44.topAnchor.constraint(equalTo: label43.bottomAnchor, constant: 10).isActive = true
        label44.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label44.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.425).isActive = true
        label44.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label45.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label45.topAnchor.constraint(equalTo: label44.bottomAnchor, constant: 10).isActive = true
        label45.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label45.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label45.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label46.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label46.topAnchor.constraint(equalTo: label45.bottomAnchor, constant: 10).isActive = true
        label46.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label46.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.35).isActive = true
        label46.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label47.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label47.topAnchor.constraint(equalTo: label46.bottomAnchor, constant: 10).isActive = true
        label47.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label47.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label47.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label48.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label48.topAnchor.constraint(equalTo: label47.bottomAnchor, constant: 10).isActive = true
        label48.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label48.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.125).isActive = true
        label48.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label49.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label49.topAnchor.constraint(equalTo: label48.bottomAnchor, constant: 10).isActive = true
        label49.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label49.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.325).isActive = true
        label49.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label50.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label50.topAnchor.constraint(equalTo: label49.bottomAnchor, constant: 10).isActive = true
        label50.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label50.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label50.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label51.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label51.topAnchor.constraint(equalTo: label50.bottomAnchor, constant: 10).isActive = true
        label51.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label51.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label51.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label52.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label52.topAnchor.constraint(equalTo: label51.bottomAnchor, constant: 10).isActive = true
        label52.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label52.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label52.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label53.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label53.topAnchor.constraint(equalTo: label52.bottomAnchor, constant: 10).isActive = true
        label53.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label53.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.325).isActive = true
        label53.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label54.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label54.topAnchor.constraint(equalTo: label53.bottomAnchor, constant: 25).isActive = true
        label54.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label54.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label54.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label55.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label55.topAnchor.constraint(equalTo: label54.bottomAnchor, constant: 10).isActive = true
        label55.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label55.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label55.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label56.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label56.topAnchor.constraint(equalTo: label55.bottomAnchor, constant: 10).isActive = true
        label56.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label56.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label56.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label57.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label57.topAnchor.constraint(equalTo: label56.bottomAnchor, constant: 10).isActive = true
        label57.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label57.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.125).isActive = true
        label57.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label58.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label58.topAnchor.constraint(equalTo: label57.bottomAnchor, constant: 10).isActive = true
        label58.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label58.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label58.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label59.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label59.topAnchor.constraint(equalTo: label58.bottomAnchor, constant: 10).isActive = true
        label59.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label59.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.125).isActive = true
        label59.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label60.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label60.topAnchor.constraint(equalTo: label59.bottomAnchor, constant: 10).isActive = true
        label60.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label60.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label60.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label61.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label61.topAnchor.constraint(equalTo: label60.bottomAnchor, constant: 10).isActive = true
        label61.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label61.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.525).isActive = true
        label61.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label62.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label62.topAnchor.constraint(equalTo: label61.bottomAnchor, constant: 10).isActive = true
        label62.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label62.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label62.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label63.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label63.topAnchor.constraint(equalTo: label62.bottomAnchor, constant: 10).isActive = true
        label63.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label63.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label63.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label64.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label64.topAnchor.constraint(equalTo: label63.bottomAnchor, constant: 10).isActive = true
        label64.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label64.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.325).isActive = true
        label64.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label65.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label65.topAnchor.constraint(equalTo: label64.bottomAnchor, constant: 10).isActive = true
        label65.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label65.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.125).isActive = true
        label65.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label66.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label66.topAnchor.constraint(equalTo: label65.bottomAnchor, constant: 10).isActive = true
        label66.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label66.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.375).isActive = true
        label66.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label67.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label67.topAnchor.constraint(equalTo: label66.bottomAnchor, constant: 10).isActive = true
        label67.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label67.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label67.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label68.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label68.topAnchor.constraint(equalTo: label67.bottomAnchor, constant: 10).isActive = true
        label68.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label68.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label68.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 18)
        
        label69.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label69.topAnchor.constraint(equalTo: label68.bottomAnchor, constant: 10).isActive = true
        label69.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label69.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.5).isActive = true
        label69.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label70.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label70.topAnchor.constraint(equalTo: label69.bottomAnchor, constant: 10).isActive = true
        label70.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label70.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label70.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        payButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        payButton.topAnchor.constraint(equalTo: label70.bottomAnchor, constant: 25).isActive = true
        payButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.65).isActive = true
        payButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        payButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.04)
        
    }
    
    @objc func handlePay() {
        
    }
    
    @objc func handleBack() {
        self.present(HomeViewController(), animated: true)
    }
    
    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true)
    }

}

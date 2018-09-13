//
//  ScheduleViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 9/10/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    lazy var backButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor =  UIColor(r: 0, g: 100, b: 157)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let mottoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Just twelve weeks to a new career!"
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    let TextScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.alpha = 0.85
        scrollView.layer.cornerRadius = 15
        scrollView.layer.masksToBounds  = true
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()
    
    let line1Text: UILabel = {
        let label = UILabel()
        
        label.text = "Georgia School of Dental Assisting"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    let line2Text: UILabel = {
        let label = UILabel()
        
        label.text = "Class Schedule"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    let line3Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 1"
        label.attributedText = NSAttributedString(string: "Week 1", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line4Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Orientation"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line5Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 1 – DA101 – Introduction to the Profession"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line6Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 2 – DA102 – Ethical & Legal Issues"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line7Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 4 – DA104 – Human Dentition"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line8Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 1 – LAB101 – The Dental Chair &"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line9Text: UILabel = {
        let label = UILabel()
        
        label.text = "Infection Control (PPE)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line10Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 2 – LAB102 – Infection Control &"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line11Text: UILabel = {
        let label = UILabel()
        
        label.text = "Maintaining the Operating Field"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line12Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 3 – LAB103 – Infection Control"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line13Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 2"
        label.attributedText = NSAttributedString(string: "Week 2", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line14Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 1 (LAB101)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line15Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 2 (LAB102)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line16Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 1 (Chapters 2, 3, & 4 – Modern Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line17Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 1 (DA101 & DA102)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line18Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 3 – DA103 – Dental Radiography"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line19Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 4 – LAB104 – Radiography Basics & X-ray"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line20Text: UILabel = {
        let label = UILabel()
        
        label.text = "Techniques/Intra-oral Camera"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line21Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 3"
        label.attributedText = NSAttributedString(string: "Week 3", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line22Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 3 (LAB103)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line23Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 4 (LAB104)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line24Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 2 (Chapter 11 – Modern Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line25Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 3 (Chapters 38 & 39 – Modern Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line26Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 2 (DA103 & DA104)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line27Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 5 – DA105 – Composition of Teeth & Dental"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line28Text: UILabel = {
        let label = UILabel()
        
        label.text = "Terminology"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line29Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 6 – DA106 – Tissues Surrounding Teeth"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line30Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 5 – LAB105 – Dental Charting"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line31Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 4"
        label.attributedText = NSAttributedString(string: "Week 4", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line32Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 5 (LAB105)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line33Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 4 (Chapters 12 & 14 – Modern Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line34Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 3 (DA105 & DA106)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line35Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 7 – DA107 – Bones of the Head"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line36Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 8 – DA108 – Muscles of the Head and Neck,"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line37Text: UILabel = {
        let label = UILabel()
        
        label.text = "the Temporomandibular Joint, & Paranasal Sinuses"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line38Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 6 – LAB106 – Alginate Impressions"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line39Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 5"
        label.attributedText = NSAttributedString(string: "Week 5", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line40Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 6 (LAB106)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line41Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 5 (Chapter 9 – Modern Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line42Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 4 (DA107 & DA108)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line43Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 9 – DA109 – Oral Pathology & Immune"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line44Text: UILabel = {
        let label = UILabel()
        
        label.text = "Systems"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line45Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 10 – DA110 – Oral Cavity & Salivary Glands"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line46Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 7 – LAB107 – Restorative Materials &"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line47Text: UILabel = {
        let label = UILabel()
        
        label.text = "Techniques/Hands-on Composites"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line48Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 6"
        label.attributedText = NSAttributedString(string: "Week 6", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line49Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 7 (LAB107)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line50Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 6 (Chapters 9 & 17 – Modern Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line51Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 5 (DA109 & DA110)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line52Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 11 – DA111 – Dental Materials/Crown"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line53Text: UILabel = {
        let label = UILabel()
        
        label.text = "Temporaries/Matrix Bands"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line54Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 12 – DA112 – Pediatric Dentistry"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line55Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 8 – LAB108 – Pedodontic Procedures"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line56Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 7"
        label.attributedText = NSAttributedString(string: "Week 7", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line57Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 8 (LAB108)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line58Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 7 (Chapter 43, 46, & 57 – Modern"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line59Text: UILabel = {
        let label = UILabel()
        
        label.text = "Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line60Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 6 (DA111 & DA112)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line61Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 13 – DA113 – Removable Prosthodontics"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line62Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 14 – DA114 – Fixed Prosthodontics"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line63Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 9 – LAB109 – Removable Prosthodontics/"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line64Text: UILabel = {
        let label = UILabel()
        
        label.text = "Crown Temps/Matrix Bands"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line65Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 10 – LAB 110 – Fixed Prosthodontics"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line66Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 8"
        label.attributedText = NSAttributedString(string: "Week 8", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line67Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 9 (LAB109)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line68Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 10 (LAB110)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line69Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 8 (Chapters 50, 51, & 52 – Modern Dental"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line70Text: UILabel = {
        let label = UILabel()
        
        label.text = "Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line71Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 7 (DA113 & DA114)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line72Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 15 – DA115 – Endodontics"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line73Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 16 – DA116 – Topical & Local Anesthesia"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line74Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 11 – LAB111 – Endodontic Instruments"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line75Text: UILabel = {
        let label = UILabel()
        
        label.text = "& Procedures/Crown Temps/Crown Preparation"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line76Text: UILabel = {
        let label = UILabel()
        
        label.text = "Video/Matrix Bands"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line77Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 12 – LAB112 – Techniques in"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line78Text: UILabel = {
        let label = UILabel()
        
        label.text = "Administering Anesthesia"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line79Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 9"
        label.attributedText = NSAttributedString(string: "Week 9", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line80Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 11 (LAB111)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line81Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 12 (LAB112)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line82Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 9 (Chapters 37 & 54 – Modern Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line83Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 8 (DA115 & DA116)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line84Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 17 – DA117 – Orthodontics"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line85Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 18 – DA118 – Periodontics"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line86Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 13 – LAB113 – Placing Sealants &"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line87Text: UILabel = {
        let label = UILabel()
        
        label.text = "At-home Bleaching"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line88Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 14 – LAB114 – Periodontal Treatment"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line89Text: UILabel = {
        let label = UILabel()
        
        label.text = "Procedures/In-Depth Suctioning"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line90Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 10"
        label.attributedText = NSAttributedString(string: "Week 10", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line91Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 13 (LAB113)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line92Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 14 (LAB114)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line93Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Quiz 10 (Chapter 55 & 60 – Modern Dental Assisting)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line94Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 9 (DA117 & DA118)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line95Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 19 – DA119 – Oral Surgery/Implants"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line96Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 20 – DA120 – Medical Emergencies in the"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line97Text: UILabel = {
        let label = UILabel()
        
        label.text = "Dental Office"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line98Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 15 – LAB115 – Oral Surgical Procedures"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line99Text: UILabel = {
        let label = UILabel()
        
        label.text = "& Videos"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line100Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Session 16 – LAB116 – CPR Training &"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line101Text: UILabel = {
        let label = UILabel()
        
        label.text = "Certification"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line102Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 11"
        label.attributedText = NSAttributedString(string: "Week 11", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line103Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lab Test 15 (LAB115)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line104Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Test 10 (DA119 & DA120)"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line105Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 21 – DA121 – Radiography In-depth Review"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line106Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Lecture 22 – DA122 – Office Management/Resume"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line107Text: UILabel = {
        let label = UILabel()
        
        label.text = "Preparation/Job Hunting Tips"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line108Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Practical Exams Review – Instrument Transfer"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line109Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Practical Exams Review – Instrument Recognition &"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line110Text: UILabel = {
        let label = UILabel()
        
        label.text = "Suction Tip Positioning"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line111Text: UILabel = {
        let label = UILabel()
        
        label.text = "Week 12"
        label.attributedText = NSAttributedString(string: "Week 12", attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line112Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Practical Exams Review – Charting & Radiography"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line113Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Practical Exams Review – X-ray Techniques/"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line114Text: UILabel = {
        let label = UILabel()
        
        label.text = "Instrument Recognition/Four-handed Dentistry"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let line115Text: UILabel = {
        let label = UILabel()
        
        label.text = "● Final Exam & Graduation"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 145, g: 183, b: 219)
        navigationItem.title = "ScheduleViewController"
        
        print(view.frame)
        //5 (0.0, 0.0, 320.0, 568.0)
        //6 (0.0, 0.0, 375.0, 667.0)
        //8 plus (0.0, 0.0, 414.0, 736.0)
        //x (0.0, 0.0, 375.0, 812.0)
        
        if view.frame == CGRect(x: 0, y: 0, width: 375.0, height: 812.0) {
            TextScrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3685)
        } else if view.frame == CGRect(x: 0, y: 0, width: 414.0, height: 736.0) {
            TextScrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3885)
        } else if view.frame == CGRect(x: 0, y: 0, width: 375.0, height: 667.0) {
            TextScrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3710)
        } else if view.frame == CGRect(x: 0, y: 0, width: 320.0, height: 568.0) {
            TextScrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3480)
        }
        
        self.view.addSubview(TextScrollView)
        self.view.addSubview(logoImageView)
        self.view.addSubview(mottoLabel)
        self.view.addSubview(backButton)
        
        setupScrollView()
        setupMottoLabel()
        setupLogoImageView()
        setupBackButton()
    }
    
    func setupScrollView() {
        // constrain the scroll view to 8-pts on each side
        TextScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        TextScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 65).isActive = true
        TextScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        TextScrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55).isActive = true
        
        TextScrollView.addSubview(line1Text)
        line1Text.centerXAnchor.constraint(equalTo: TextScrollView.centerXAnchor).isActive = true
        line1Text.topAnchor.constraint(equalTo: TextScrollView.topAnchor, constant: 15).isActive = true
        line1Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 25)
        
        TextScrollView.addSubview(line2Text)
        line2Text.centerXAnchor.constraint(equalTo: TextScrollView.centerXAnchor).isActive = true
        line2Text.topAnchor.constraint(equalTo: line1Text.bottomAnchor, constant: 15).isActive = true
        line2Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line3Text)
        line3Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line3Text.topAnchor.constraint(equalTo: line2Text.bottomAnchor, constant: 30).isActive = true
        line3Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line4Text)
        line4Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line4Text.topAnchor.constraint(equalTo: line3Text.bottomAnchor, constant: 15).isActive = true
        line4Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line5Text)
        line5Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line5Text.topAnchor.constraint(equalTo: line4Text.bottomAnchor, constant: 15).isActive = true
        line5Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line6Text)
        line6Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line6Text.topAnchor.constraint(equalTo: line5Text.bottomAnchor, constant: 15).isActive = true
        line6Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line7Text)
        line7Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line7Text.topAnchor.constraint(equalTo: line6Text.bottomAnchor, constant: 15).isActive = true
        line7Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line8Text)
        line8Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line8Text.topAnchor.constraint(equalTo: line7Text.bottomAnchor, constant: 15).isActive = true
        line8Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line9Text)
        line9Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line9Text.topAnchor.constraint(equalTo: line8Text.bottomAnchor, constant: 15).isActive = true
        line9Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line10Text)
        line10Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line10Text.topAnchor.constraint(equalTo: line9Text.bottomAnchor, constant: 15).isActive = true
        line10Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line11Text)
        line11Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line11Text.topAnchor.constraint(equalTo: line10Text.bottomAnchor, constant: 15).isActive = true
        line11Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line12Text)
        line12Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line12Text.topAnchor.constraint(equalTo: line11Text.bottomAnchor, constant: 15).isActive = true
        line12Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line13Text)
        line13Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line13Text.topAnchor.constraint(equalTo: line12Text.bottomAnchor, constant: 30).isActive = true
        line13Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line14Text)
        line14Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line14Text.topAnchor.constraint(equalTo: line13Text.bottomAnchor, constant: 15).isActive = true
        line14Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line15Text)
        line15Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line15Text.topAnchor.constraint(equalTo: line14Text.bottomAnchor, constant: 15).isActive = true
        line15Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line16Text)
        line16Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line16Text.topAnchor.constraint(equalTo: line15Text.bottomAnchor, constant: 15).isActive = true
        line16Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line17Text)
        line17Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line17Text.topAnchor.constraint(equalTo: line16Text.bottomAnchor, constant: 15).isActive = true
        line17Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line18Text)
        line18Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line18Text.topAnchor.constraint(equalTo: line17Text.bottomAnchor, constant: 15).isActive = true
        line18Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line19Text)
        line19Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line19Text.topAnchor.constraint(equalTo: line18Text.bottomAnchor, constant: 15).isActive = true
        line19Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line20Text)
        line20Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line20Text.topAnchor.constraint(equalTo: line19Text.bottomAnchor, constant: 15).isActive = true
        line20Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line21Text)
        line21Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line21Text.topAnchor.constraint(equalTo: line20Text.bottomAnchor, constant: 30).isActive = true
        line21Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line22Text)
        line22Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line22Text.topAnchor.constraint(equalTo: line21Text.bottomAnchor, constant: 15).isActive = true
        line22Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line23Text)
        line23Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line23Text.topAnchor.constraint(equalTo: line22Text.bottomAnchor, constant: 15).isActive = true
        line23Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line24Text)
        line24Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line24Text.topAnchor.constraint(equalTo: line23Text.bottomAnchor, constant: 15).isActive = true
        line24Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line25Text)
        line25Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line25Text.topAnchor.constraint(equalTo: line24Text.bottomAnchor, constant: 15).isActive = true
        line25Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line26Text)
        line26Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line26Text.topAnchor.constraint(equalTo: line25Text.bottomAnchor, constant: 15).isActive = true
        line26Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line27Text)
        line27Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line27Text.topAnchor.constraint(equalTo: line26Text.bottomAnchor, constant: 15).isActive = true
        line27Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line28Text)
        line28Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line28Text.topAnchor.constraint(equalTo: line27Text.bottomAnchor, constant: 15).isActive = true
        line28Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line29Text)
        line29Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line29Text.topAnchor.constraint(equalTo: line28Text.bottomAnchor, constant: 15).isActive = true
        line29Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line30Text)
        line30Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line30Text.topAnchor.constraint(equalTo: line29Text.bottomAnchor, constant: 15).isActive = true
        line30Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line31Text)
        line31Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line31Text.topAnchor.constraint(equalTo: line30Text.bottomAnchor, constant: 30).isActive = true
        line31Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line32Text)
        line32Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line32Text.topAnchor.constraint(equalTo: line31Text.bottomAnchor, constant: 15).isActive = true
        line32Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line33Text)
        line33Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line33Text.topAnchor.constraint(equalTo: line32Text.bottomAnchor, constant: 15).isActive = true
        line33Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line34Text)
        line34Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line34Text.topAnchor.constraint(equalTo: line33Text.bottomAnchor, constant: 15).isActive = true
        line34Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line35Text)
        line35Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line35Text.topAnchor.constraint(equalTo: line34Text.bottomAnchor, constant: 15).isActive = true
        line35Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line36Text)
        line36Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line36Text.topAnchor.constraint(equalTo: line35Text.bottomAnchor, constant: 15).isActive = true
        line36Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line37Text)
        line37Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line37Text.topAnchor.constraint(equalTo: line36Text.bottomAnchor, constant: 15).isActive = true
        line37Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line38Text)
        line38Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line38Text.topAnchor.constraint(equalTo: line37Text.bottomAnchor, constant: 15).isActive = true
        line38Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line39Text)
        line39Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line39Text.topAnchor.constraint(equalTo: line38Text.bottomAnchor, constant: 30).isActive = true
        line39Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line40Text)
        line40Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line40Text.topAnchor.constraint(equalTo: line39Text.bottomAnchor, constant: 15).isActive = true
        line40Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line41Text)
        line41Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line41Text.topAnchor.constraint(equalTo: line40Text.bottomAnchor, constant: 15).isActive = true
        line41Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line42Text)
        line42Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line42Text.topAnchor.constraint(equalTo: line41Text.bottomAnchor, constant: 15).isActive = true
        line42Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line43Text)
        line43Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line43Text.topAnchor.constraint(equalTo: line42Text.bottomAnchor, constant: 15).isActive = true
        line43Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line44Text)
        line44Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line44Text.topAnchor.constraint(equalTo: line43Text.bottomAnchor, constant: 15).isActive = true
        line44Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line45Text)
        line45Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line45Text.topAnchor.constraint(equalTo: line44Text.bottomAnchor, constant: 15).isActive = true
        line45Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line46Text)
        line46Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line46Text.topAnchor.constraint(equalTo: line45Text.bottomAnchor, constant: 15).isActive = true
        line46Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line47Text)
        line47Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line47Text.topAnchor.constraint(equalTo: line46Text.bottomAnchor, constant: 15).isActive = true
        line47Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line48Text)
        line48Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line48Text.topAnchor.constraint(equalTo: line47Text.bottomAnchor, constant: 30).isActive = true
        line48Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line49Text)
        line49Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line49Text.topAnchor.constraint(equalTo: line48Text.bottomAnchor, constant: 15).isActive = true
        line49Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line50Text)
        line50Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line50Text.topAnchor.constraint(equalTo: line49Text.bottomAnchor, constant: 15).isActive = true
        line50Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line51Text)
        line51Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line51Text.topAnchor.constraint(equalTo: line50Text.bottomAnchor, constant: 15).isActive = true
        line51Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line52Text)
        line52Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line52Text.topAnchor.constraint(equalTo: line51Text.bottomAnchor, constant: 15).isActive = true
        line52Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line53Text)
        line53Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line53Text.topAnchor.constraint(equalTo: line52Text.bottomAnchor, constant: 15).isActive = true
        line53Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line54Text)
        line54Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line54Text.topAnchor.constraint(equalTo: line53Text.bottomAnchor, constant: 15).isActive = true
        line54Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line55Text)
        line55Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line55Text.topAnchor.constraint(equalTo: line54Text.bottomAnchor, constant: 15).isActive = true
        line55Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line56Text)
        line56Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line56Text.topAnchor.constraint(equalTo: line55Text.bottomAnchor, constant: 30).isActive = true
        line56Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line57Text)
        line57Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line57Text.topAnchor.constraint(equalTo: line56Text.bottomAnchor, constant: 15).isActive = true
        line57Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line58Text)
        line58Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line58Text.topAnchor.constraint(equalTo: line57Text.bottomAnchor, constant: 15).isActive = true
        line58Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line59Text)
        line59Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line59Text.topAnchor.constraint(equalTo: line58Text.bottomAnchor, constant: 15).isActive = true
        line59Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line60Text)
        line60Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line60Text.topAnchor.constraint(equalTo: line59Text.bottomAnchor, constant: 15).isActive = true
        line60Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line61Text)
        line61Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line61Text.topAnchor.constraint(equalTo: line60Text.bottomAnchor, constant: 15).isActive = true
        line61Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line62Text)
        line62Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line62Text.topAnchor.constraint(equalTo: line61Text.bottomAnchor, constant: 15).isActive = true
        line62Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line63Text)
        line63Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line63Text.topAnchor.constraint(equalTo: line62Text.bottomAnchor, constant: 15).isActive = true
        line63Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line64Text)
        line64Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line64Text.topAnchor.constraint(equalTo: line63Text.bottomAnchor, constant: 15).isActive = true
        line64Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line65Text)
        line65Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line65Text.topAnchor.constraint(equalTo: line64Text.bottomAnchor, constant: 15).isActive = true
        line65Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line66Text)
        line66Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line66Text.topAnchor.constraint(equalTo: line65Text.bottomAnchor, constant: 30).isActive = true
        line66Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line67Text)
        line67Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line67Text.topAnchor.constraint(equalTo: line66Text.bottomAnchor, constant: 15).isActive = true
        line67Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line68Text)
        line68Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line68Text.topAnchor.constraint(equalTo: line67Text.bottomAnchor, constant: 15).isActive = true
        line68Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line69Text)
        line69Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line69Text.topAnchor.constraint(equalTo: line68Text.bottomAnchor, constant: 15).isActive = true
        line69Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line70Text)
        line70Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line70Text.topAnchor.constraint(equalTo: line69Text.bottomAnchor, constant: 15).isActive = true
        line70Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line71Text)
        line71Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line71Text.topAnchor.constraint(equalTo: line70Text.bottomAnchor, constant: 15).isActive = true
        line71Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line72Text)
        line72Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line72Text.topAnchor.constraint(equalTo: line71Text.bottomAnchor, constant: 15).isActive = true
        line72Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line73Text)
        line73Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line73Text.topAnchor.constraint(equalTo: line72Text.bottomAnchor, constant: 15).isActive = true
        line73Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line74Text)
        line74Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line74Text.topAnchor.constraint(equalTo: line73Text.bottomAnchor, constant: 15).isActive = true
        line74Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line75Text)
        line75Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line75Text.topAnchor.constraint(equalTo: line74Text.bottomAnchor, constant: 15).isActive = true
        line75Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line76Text)
        line76Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line76Text.topAnchor.constraint(equalTo: line75Text.bottomAnchor, constant: 15).isActive = true
        line76Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line77Text)
        line77Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line77Text.topAnchor.constraint(equalTo: line76Text.bottomAnchor, constant: 15).isActive = true
        line77Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line78Text)
        line78Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line78Text.topAnchor.constraint(equalTo: line77Text.bottomAnchor, constant: 15).isActive = true
        line78Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line79Text)
        line79Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line79Text.topAnchor.constraint(equalTo: line78Text.bottomAnchor, constant: 30).isActive = true
        line79Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line80Text)
        line80Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line80Text.topAnchor.constraint(equalTo: line79Text.bottomAnchor, constant: 15).isActive = true
        line80Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line81Text)
        line81Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line81Text.topAnchor.constraint(equalTo: line80Text.bottomAnchor, constant: 15).isActive = true
        line81Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line82Text)
        line82Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line82Text.topAnchor.constraint(equalTo: line81Text.bottomAnchor, constant: 15).isActive = true
        line82Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line83Text)
        line83Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line83Text.topAnchor.constraint(equalTo: line82Text.bottomAnchor, constant: 15).isActive = true
        line83Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line84Text)
        line84Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line84Text.topAnchor.constraint(equalTo: line83Text.bottomAnchor, constant: 15).isActive = true
        line84Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line85Text)
        line85Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line85Text.topAnchor.constraint(equalTo: line84Text.bottomAnchor, constant: 15).isActive = true
        line85Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line86Text)
        line86Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line86Text.topAnchor.constraint(equalTo: line85Text.bottomAnchor, constant: 15).isActive = true
        line86Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line87Text)
        line87Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line87Text.topAnchor.constraint(equalTo: line86Text.bottomAnchor, constant: 15).isActive = true
        line87Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line88Text)
        line88Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line88Text.topAnchor.constraint(equalTo: line87Text.bottomAnchor, constant: 15).isActive = true
        line88Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line89Text)
        line89Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line89Text.topAnchor.constraint(equalTo: line88Text.bottomAnchor, constant: 15).isActive = true
        line89Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line90Text)
        line90Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line90Text.topAnchor.constraint(equalTo: line89Text.bottomAnchor, constant: 30).isActive = true
        line90Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line91Text)
        line91Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line91Text.topAnchor.constraint(equalTo: line90Text.bottomAnchor, constant: 15).isActive = true
        line91Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line92Text)
        line92Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line92Text.topAnchor.constraint(equalTo: line91Text.bottomAnchor, constant: 15).isActive = true
        line92Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line93Text)
        line93Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line93Text.topAnchor.constraint(equalTo: line92Text.bottomAnchor, constant: 15).isActive = true
        line93Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line94Text)
        line94Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line94Text.topAnchor.constraint(equalTo: line93Text.bottomAnchor, constant: 15).isActive = true
        line94Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line95Text)
        line95Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line95Text.topAnchor.constraint(equalTo: line94Text.bottomAnchor, constant: 15).isActive = true
        line95Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line96Text)
        line96Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line96Text.topAnchor.constraint(equalTo: line95Text.bottomAnchor, constant: 15).isActive = true
        line96Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line97Text)
        line97Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line97Text.topAnchor.constraint(equalTo: line96Text.bottomAnchor, constant: 15).isActive = true
        line97Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line98Text)
        line98Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line98Text.topAnchor.constraint(equalTo: line97Text.bottomAnchor, constant: 15).isActive = true
        line98Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line99Text)
        line99Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line99Text.topAnchor.constraint(equalTo: line98Text.bottomAnchor, constant: 15).isActive = true
        line99Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line100Text)
        line100Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line100Text.topAnchor.constraint(equalTo: line99Text.bottomAnchor, constant: 15).isActive = true
        line100Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line101Text)
        line101Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line101Text.topAnchor.constraint(equalTo: line100Text.bottomAnchor, constant: 15).isActive = true
        line101Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line102Text)
        line102Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line102Text.topAnchor.constraint(equalTo: line101Text.bottomAnchor, constant: 30).isActive = true
        line102Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line103Text)
        line103Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line103Text.topAnchor.constraint(equalTo: line102Text.bottomAnchor, constant: 15).isActive = true
        line103Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line104Text)
        line104Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line104Text.topAnchor.constraint(equalTo: line103Text.bottomAnchor, constant: 15).isActive = true
        line104Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line105Text)
        line105Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line105Text.topAnchor.constraint(equalTo: line104Text.bottomAnchor, constant: 15).isActive = true
        line105Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line106Text)
        line106Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line106Text.topAnchor.constraint(equalTo: line105Text.bottomAnchor, constant: 15).isActive = true
        line106Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line107Text)
        line107Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line107Text.topAnchor.constraint(equalTo: line106Text.bottomAnchor, constant: 15).isActive = true
        line107Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line108Text)
        line108Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line108Text.topAnchor.constraint(equalTo: line107Text.bottomAnchor, constant: 15).isActive = true
        line108Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line109Text)
        line109Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line109Text.topAnchor.constraint(equalTo: line108Text.bottomAnchor, constant: 15).isActive = true
        line109Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line110Text)
        line110Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line110Text.topAnchor.constraint(equalTo: line109Text.bottomAnchor, constant: 15).isActive = true
        line110Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line111Text)
        line111Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line111Text.topAnchor.constraint(equalTo: line110Text.bottomAnchor, constant: 30).isActive = true
        line111Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line112Text)
        line112Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line112Text.topAnchor.constraint(equalTo: line111Text.bottomAnchor, constant: 15).isActive = true
        line112Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line113Text)
        line113Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line113Text.topAnchor.constraint(equalTo: line112Text.bottomAnchor, constant: 15).isActive = true
        line113Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line114Text)
        line114Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line114Text.topAnchor.constraint(equalTo: line113Text.bottomAnchor, constant: 15).isActive = true
        line114Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
        TextScrollView.addSubview(line115Text)
        line115Text.leftAnchor.constraint(equalTo: TextScrollView.leftAnchor, constant: 5).isActive = true
        line115Text.topAnchor.constraint(equalTo: line114Text.bottomAnchor, constant: 15).isActive = true
        line115Text.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 30)
        
    }
    
    @objc func backButtonAction() {
        let mmvc = MainMenuViewController() as UIViewController
        self.navigationController?.pushViewController(mmvc, animated: true)
    }
    
    func setupBackButton() {
        backButton.topAnchor.constraint(equalTo: TextScrollView.bottomAnchor, constant: 15).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
    }
    
    func setupLogoImageView() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    func setupMottoLabel() {
        mottoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mottoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -1).isActive = true
        mottoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        mottoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mottoLabel.font = UIFont(name: "SavoyeLetPlain", size: view.frame.width / 11)
    }

}

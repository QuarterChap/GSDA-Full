//
//  CurriculumViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/15/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class CurriculumViewController: UIViewController {
    
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
    
    let label1: UILabel = {
        let label = UILabel()
        
        label.text = "Curriculum"
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
    
    let label2: UILabel = {
        let label = UILabel()
        
        label.text = "Lecture Series"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
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
        
        label.text = "Introduction to the Profession"
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
    
    let label4: UILabel = {
        let label = UILabel()
        
        label.text = "DA 101"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
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
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label6: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label7: UILabel = {
        let label = UILabel()
        
        label.text = "Students are introduced to the profession of Dentistry and the responsibilities of the dental health team which includes the dentist, hygienist, the front office personnel and the back office personnel."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label8: UILabel = {
        let label = UILabel()
        
        label.text = "Ethical and Legal Issues"
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
    
    let label9: UILabel = {
        let label = UILabel()
        
        label.text = "DA 102"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label10: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label11: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label12: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the ethics governing dentistry and the various governmental agencies entrusted with the regulation of the dental profession to ensure and protect the public from incompetent and unethical practices. Topics include licensure procedures and credentialing."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label13: UILabel = {
        let label = UILabel()
        
        label.text = "Dental Radiography"
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
    
    let label14: UILabel = {
        let label = UILabel()
        
        label.text = "DA 103"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label15: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label16: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label17: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the basic principles of X-Ray.   The operating principle of the X-Ray Machine is also discussed. Topics also include types of film exposures and film processing errors."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label18: UILabel = {
        let label = UILabel()
        
        label.text = "Human Dentition"
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
    
    let label19: UILabel = {
        let label = UILabel()
        
        label.text = "DA 104"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label20: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label21: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label22: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the form and structures of the human natural teeth in the dental arch. Topics also include the method of identifying teeth by using the Universal Numbering System for permanent and primary teeth."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label23: UILabel = {
        let label = UILabel()
        
        label.text = "Composition of Teeth and Dental Terminology"
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
    
    let label24: UILabel = {
        let label = UILabel()
        
        label.text = "DA 105"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label25: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label26: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label27: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the different parts of the tooth. Topics include cervix, apex, dental pulp, tissues of the teeth such as enamel, dentin and cementum. Also includes discussion of anatomical landmarks of the tooth and dental terminology."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label28: UILabel = {
        let label = UILabel()
        
        label.text = "Bones of the Head"
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
    
    let label29: UILabel = {
        let label = UILabel()
        
        label.text = "DA 107"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label30: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label31: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label32: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the basic anatomy and physiology of the human skull. Topics include the cranium and the bones of the face."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label33: UILabel = {
        let label = UILabel()
        
        label.text = "Muscles of the Head and Neck and Temporomandibular Joint (TMJ) and Paranasal Sinuses"
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
    
    let label34: UILabel = {
        let label = UILabel()
        
        label.text = "DA 108"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label35: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label36: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label37: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the muscles of the head and neck and the temporomandibular joint which connects the maxillary and mandibular jaws. Topic also includes paranasal sinuses which are the air cavities in the bones above and each side of the nasal cavities."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label38: UILabel = {
        let label = UILabel()
        
        label.text = "Oral Pathology"
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
    
    let label39: UILabel = {
        let label = UILabel()
        
        label.text = "DA 109"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label40: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label41: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label42: UILabel = {
        let label = UILabel()
        
        label.text = "Student will learn the nature of diseases that affect oral structures and regions nearby. Topics include discussion on how to distinguish normal from abnormal conditions in the oral cavity."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label43: UILabel = {
        let label = UILabel()
        
        label.text = "Oral Cavity, Salivary Glands and Immune System"
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
    
    let label44: UILabel = {
        let label = UILabel()
        
        label.text = "DA 110"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label45: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label46: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label47: UILabel = {
        let label = UILabel()
        
        label.text = "Students will earn the cavity of the mouth and the salivary glands which are located outside the oral cavity. Topics include discussion of infectious diseases that can be transmitted from the patient in a dental environment."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label48: UILabel = {
        let label = UILabel()
        
        label.text = "Dental Materials"
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
    
    let label49: UILabel = {
        let label = UILabel()
        
        label.text = "DA 111"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label50: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label51: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label52: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn various materials used in dentistry. Topics include cavity varnishes and liners, dental cements, surgical cements/periodontal dressing, glass ionomer cements, composites, sealants and dental amalgams."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label53: UILabel = {
        let label = UILabel()
        
        label.text = "Pediatric Dentistry"
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
    
    let label54: UILabel = {
        let label = UILabel()
        
        label.text = "DA 112"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label55: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label56: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label57: UILabel = {
        let label = UILabel()
        
        label.text = "Specialty limited to the dental care of children. The students will learn the special requirements prior to treatment of children. Topics include informed consent from guardians, behavioral management of children during treatment and the common pediatric dental procedures."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
       
        return label
    }()
    
    let label58: UILabel = {
        let label = UILabel()
        
        label.text = "Removal Prosthodontics (RPD)"
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
    
    let label59: UILabel = {
        let label = UILabel()
        
        label.text = "DA 113"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label60: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label61: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label62: UILabel = {
        let label = UILabel()
        
        label.text = "Removable Prosthodontics (RPD) replaces missing teeth. The students will learn the component parts of both the partial and complete RPD’s and the various steps necessary to take during replacement appointment with patient."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label63: UILabel = {
        let label = UILabel()
        
        label.text = "Fixed Prosthodontics"
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
    
    let label64: UILabel = {
        let label = UILabel()
        
        label.text = "DA 114"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label65: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label66: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label67: UILabel = {
        let label = UILabel()
        
        label.text = "Complete restoration, or the replacement, of one or more teeth in a dental arch. The students will learn the different types of fixed prosthodontics restorations."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1

        return label
    }()
    
    let label68: UILabel = {
        let label = UILabel()
        
        label.text = "Endodontics"
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
    
    let label69: UILabel = {
        let label = UILabel()
        
        label.text = "DA 115"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label70: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label71: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label72: UILabel = {
        let label = UILabel()
        
        label.text = "More commonly referred to as Root Canal Therapy. The students will learn the steps in a root canal procedure and the different instruments and materials required."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()

    let label73: UILabel = {
        let label = UILabel()
        
        label.text = "Topical and Local Anesthesia"
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
    
    let label74: UILabel = {
        let label = UILabel()
        
        label.text = "DA 116"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label75: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label76: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label77: UILabel = {
        let label = UILabel()
        
        label.text = "Application of anesthetics to oral tissues. The students will learn the properties of anesthesia and when and where they are used."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label78: UILabel = {
        let label = UILabel()
        
        label.text = "Orthodontics"
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
    
    let label79: UILabel = {
        let label = UILabel()
        
        label.text = "DA 117"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label80: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label81: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 104"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label82: UILabel = {
        let label = UILabel()
        
        label.text = "Prevention and correction of dental and oral deviations. The students will learn the various types and causes of malformations and malocclusions and how they are corrected."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label83: UILabel = {
        let label = UILabel()
        
        label.text = "Periodontics"
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
    
    let label84: UILabel = {
        let label = UILabel()
        
        label.text = "DA 118"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    
    let label85: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label86: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label87: UILabel = {
        let label = UILabel()
        
        label.text = "Deals with the prevention and treatment of periodontal diseases which is the most common cause of tooth loss. The students will learn the causes of periodontal disease, symptoms, examination procedures and treatment."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label88: UILabel = {
        let label = UILabel()
        
        label.text = "Oral Surgery"
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
    
    let label89: UILabel = {
        let label = UILabel()
        
        label.text = "DA 119"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label90: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label91: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label92: UILabel = {
        let label = UILabel()
        
        label.text = "Involves with removing of teeth, treating jaw fractures, bone and tissue grafts and removal of tumors and cysts and reconstruction of oral and dental deformities. The students will learn the various procedures and instruments use in oral surgery."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label93: UILabel = {
        let label = UILabel()
        
        label.text = "Medical Emergencies in the Dental Office"
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
    
    let label94: UILabel = {
        let label = UILabel()
        
        label.text = "DA 120"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label95: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label96: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label97: UILabel = {
        let label = UILabel()
        
        label.text = "Risk associated with providing medical and dental care. The students will learn how to respond to medical emergencies."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label98: UILabel = {
        let label = UILabel()
        
        label.text = "Radiography In Depth Overview"
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
    
    let label99: UILabel = {
        let label = UILabel()
        
        label.text = "DA 121"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label100: UILabel = {
        let label = UILabel()
        
        label.text = "4 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
    
        return label
    }()
    
    let label101: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 103"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label102: UILabel = {
        let label = UILabel()
        
        label.text = "The students will have an in depth review of subjects likely to be encountered on the state specific radiographic written examination. A good grasp of this subject will greatly enhance the student’s likelihood of passing the written examination."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label103: UILabel = {
        let label = UILabel()
        
        label.text = "Front Office Mgt. and Resume Preparation"
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
    
    let label104: UILabel = {
        let label = UILabel()
        
        label.text = "DA 122"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label105: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    
    let label106: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()

    let label107: UILabel = {
        let label = UILabel()
        
        label.text = "Student learns front office duties, reception, record keeping, patient scheduling and general office management/maintenance. The students will also learn how to write effective resumes."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()

    let label108: UILabel = {
        let label = UILabel()
        
        label.text = "Lab Sessions"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label109: UILabel = {
        let label = UILabel()
        
        label.text = "Dental Chair and Infection Control (PPE)"
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
    
    let label110: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 101"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label111: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label112: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label113: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the different components of the dental operatory and dental chair. They will be taught how to operate the dental chair and the various associated instruments. The goals of infection control are discussed together with Occupational Safety and Health Administration (OSHA) requirements and standards. Students are taught how to don the various Personal Protective Equipment (PPE) required in the dental clinic."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label114: UILabel = {
        let label = UILabel()
        
        label.text = "Infection Control: Maintaining the Operating Field, Dental Instruments and Trays"
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
    
    let label115: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 102"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label116: UILabel = {
        let label = UILabel()
        
        label.text = "1.5 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label117: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: Lab 101"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label118: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the techniques in maintaining the operating field clean, visible, accessible and comfortable for the patient. They will also learn the various dental instruments, how they are organized to the tasks they are to perform and separated onto trays. During this session, a clinical video of the set-up and breakdown of dental operatory will be shown."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label119: UILabel = {
        let label = UILabel()
        
        label.text = "Infection Control: Treatment Preparation and Clean-up"
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
    
    let label120: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 103"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label121: UILabel = {
        let label = UILabel()
        
        label.text = "1.5 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label122: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: Lab 101"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label123: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the procedures performed by the dental assistant prior to seating a patient in the operatory. Students are taught to follow the Centers for Disease Control (CDC) Guidelines in effective infection control. They will also learn the various procedures required to be accomplished following dental treatment."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label124: UILabel = {
        let label = UILabel()
        
        label.text = "Radiography Basics and X-Ray Procedures"
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
    
    let label125: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 104"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label126: UILabel = {
        let label = UILabel()
        
        label.text = "8 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label127: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: LAB101, DA 103, DA 104"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label128: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn basic x-ray techniques. They will also learn how to take full mouth series of x-rays. Students will be asked to take x-rays, developing and mounting radiographs."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label129: UILabel = {
        let label = UILabel()
        
        label.text = "Dental Charting"
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
    
    let label130: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 105"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label131: UILabel = {
        let label = UILabel()
        
        label.text = "6 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label132: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 104"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label133: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn how to document the present dental conditions of the patient and the dental services to be rendered. This serves as a legal record of the patient. The students are taught and asked to prepare a dental chart using appropriate symbols and abbreviations."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label134: UILabel = {
        let label = UILabel()
        
        label.text = "Alginate Impressions, Laboratory Materials and Techniques"
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
    
    let label135: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 106"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label136: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label137: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 104"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label138: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn that Alginate Impressions are taken in order to capture an accurate three dimensional duplication of a patient’s teeth and/or surrounding tissues. Students are taught how to get alginate impressions. Students also learn to take impressions using silicon and gypsum."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label139: UILabel = {
        let label = UILabel()
        
        label.text = "Restorative Materials and Techniques"
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
    
    let label140: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 107"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label141: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label142: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label143: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the use of bonding agents to be used between the tooth structures and the restoration.They are taught to prepare bonding agents using various instruments. In addition to the actual demonstration, a clinical video of amalgam restoration and composite resin restoration is shown to the students during this session."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label144: UILabel = {
        let label = UILabel()
        
        label.text = "Pedodontic Procedures"
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
    
    let label145: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 108"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label146: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label147: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 104, DA 111"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label148: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the procedure performed if the pulp of a primary or newly erupted permanent tooth has been exposed. Students are taught to setup trays for the pulpotomy and stainless crown placement procedure. Students are also taught how to mix Zinc Oxide Eugenol (ZOE) base and permanent cement. A clinical video of crown preparation is shown during this session."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label149: UILabel = {
        let label = UILabel()
        
        label.text = "Removable Prosthodontics"
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
    
    let label150: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 109"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label151: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label152: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 113"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label153: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the steps involve in the fabrication and installation of complete (full) and partial dentures. Students are asked to practice putting tray set-ups together for each stage of removable and Prosthodontic fabrication and delivery."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label154: UILabel = {
        let label = UILabel()
        
        label.text = "Fixed Prosthodontics"
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
    
    let label155: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 110"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label156: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label157: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 114"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label158: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the proper technique for expelling impression materials. They are taught how to fabricate and adjust temporaries."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label159: UILabel = {
        let label = UILabel()
        
        label.text = "Endodontic Instruments and Procedures"
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
    
    let label160: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 111"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label161: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label162: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 115"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label163: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn endodontics (root canal) procedures and the various materials and instruments use. Students are taught to place the rubber dam on the typodont."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label164: UILabel = {
        let label = UILabel()
        
        label.text = "Techniques in Administering Anesthesia"
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
    
    let label165: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 112"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label166: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label167: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 116"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label168: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the proper use of anesthesia in the dental practice. Students are taught how to load syringes, proper passing techniques and safe recapping techniques."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label169: UILabel = {
        let label = UILabel()
        
        label.text = "Placing Sealants and Home Bleaching"
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
    
    let label170: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 113"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label171: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label172: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label173: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn that newly erupted and caries free teeth benefit from sealants. Students are taught how to apply sealants and bleaching techniques."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label174: UILabel = {
        let label = UILabel()
        
        label.text = "Periodontal Treatment Procedures"
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
    
    let label175: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 114"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label176: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label177: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 118"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label178: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the various steps and instruments used in sealing, prophylaxis and polishing. Students are taught the techniques in passing periodontal instruments. They are also taught how to assemble the ultrasonic scaler correctly."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label179: UILabel = {
        let label = UILabel()
        
        label.text = "Oral Surgical Procedures"
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
    
    let label180: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 115"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label181: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label182: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA 119"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label183: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the instruments needed for routine surgical and dental extraction. Students are taught instrument passing in the correct order for a typical tooth extraction and how they are passed over a patient. To further enhance classroom demonstration, a clinical video of oral surgical procedure is shown to the students during this session."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label184: UILabel = {
        let label = UILabel()
        
        label.text = "CPR Training and Certification"
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
    
    let label185: UILabel = {
        let label = UILabel()
        
        label.text = "Lab 116"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label186: UILabel = {
        let label = UILabel()
        
        label.text = "2 Hour Lab"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label187: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: None"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label188: UILabel = {
        let label = UILabel()
        
        label.text = "Students are taught how to administer Cardio Pulmonary Resuscitation. Training will be conducted by representatives of the local American Red Cross or Fire Department. Upon completion of this training students will be awarded Certificates of Completion."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label189: UILabel = {
        let label = UILabel()
        
        label.text = "Exams & Externship"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label190: UILabel = {
        let label = UILabel()
        
        label.text = "Practical Exams Review, Exams & Graduation"
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
    
    let label191: UILabel = {
        let label = UILabel()
        
        label.text = "Exams"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label192: UILabel = {
        let label = UILabel()
        
        label.text = "12 Hours"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label193: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: Dental Assisting Program"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label194: UILabel = {
        let label = UILabel()
        
        label.text = "Externship"
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
    
    let label195: UILabel = {
        let label = UILabel()
        
        label.text = "EXT 101"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label196: UILabel = {
        let label = UILabel()
        
        label.text = "50 Hours"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label197: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: Dental Assisting Program"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label198: UILabel = {
        let label = UILabel()
        
        label.text = "Students will undergo fifty (50) hours of on the job training in the office of a practicing dentist to further enhance their hands on experience. This training could be conducted in the school premises or in the offices of other participating dentists."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label199: UILabel = {
        let label = UILabel()
        
        label.text = "Tissues Surrounding the Teeth"
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
    
    let label200: UILabel = {
        let label = UILabel()
        
        label.text = "DA 106"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label201: UILabel = {
        let label = UILabel()
        
        label.text = "1 Hour Lecture"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label202: UILabel = {
        let label = UILabel()
        
        label.text = "Prerequisite: DA104"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        
        return label
    }()
    
    let label203: UILabel = {
        let label = UILabel()
        
        label.text = "Students will learn the tissues supporting the human teeth. Topics include the alveolar process, the periodontal ligament and the gingiva (gums) which are collectively known as the periodontium."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
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
        navigationItem.title = "CurriculumViewController"
     
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 13000)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 14850)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 16150)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 17550)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 19150)
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
        self.scrollView.addSubview(label1)
        self.scrollView.addSubview(label2)
        self.scrollView.addSubview(label3)
        self.scrollView.addSubview(label4)
        self.scrollView.addSubview(label5)
        self.scrollView.addSubview(label6)
        self.scrollView.addSubview(label7)
        self.scrollView.addSubview(label8)
        self.scrollView.addSubview(label9)
        self.scrollView.addSubview(label10)
        self.scrollView.addSubview(label11)
        self.scrollView.addSubview(label12)
        self.scrollView.addSubview(label13)
        self.scrollView.addSubview(label14)
        self.scrollView.addSubview(label15)
        self.scrollView.addSubview(label16)
        self.scrollView.addSubview(label17)
        self.scrollView.addSubview(label18)
        self.scrollView.addSubview(label19)
        self.scrollView.addSubview(label20)
        self.scrollView.addSubview(label21)
        self.scrollView.addSubview(label22)
        self.scrollView.addSubview(label23)
        self.scrollView.addSubview(label24)
        self.scrollView.addSubview(label25)
        self.scrollView.addSubview(label26)
        self.scrollView.addSubview(label27)
        self.scrollView.addSubview(label28)
        self.scrollView.addSubview(label29)
        self.scrollView.addSubview(label30)
        self.scrollView.addSubview(label31)
        self.scrollView.addSubview(label32)
        self.scrollView.addSubview(label33)
        self.scrollView.addSubview(label34)
        self.scrollView.addSubview(label35)
        self.scrollView.addSubview(label36)
        self.scrollView.addSubview(label37)
        self.scrollView.addSubview(label38)
        self.scrollView.addSubview(label39)
        self.scrollView.addSubview(label40)
        self.scrollView.addSubview(label41)
        self.scrollView.addSubview(label42)
        self.scrollView.addSubview(label43)
        self.scrollView.addSubview(label44)
        self.scrollView.addSubview(label45)
        self.scrollView.addSubview(label46)
        self.scrollView.addSubview(label47)
        self.scrollView.addSubview(label48)
        self.scrollView.addSubview(label49)
        self.scrollView.addSubview(label50)
        self.scrollView.addSubview(label51)
        self.scrollView.addSubview(label52)
        self.scrollView.addSubview(label53)
        self.scrollView.addSubview(label54)
        self.scrollView.addSubview(label55)
        self.scrollView.addSubview(label56)
        self.scrollView.addSubview(label57)
        self.scrollView.addSubview(label58)
        self.scrollView.addSubview(label59)
        self.scrollView.addSubview(label60)
        self.scrollView.addSubview(label61)
        self.scrollView.addSubview(label62)
        self.scrollView.addSubview(label63)
        self.scrollView.addSubview(label64)
        self.scrollView.addSubview(label65)
        self.scrollView.addSubview(label66)
        self.scrollView.addSubview(label67)
        self.scrollView.addSubview(label68)
        self.scrollView.addSubview(label69)
        self.scrollView.addSubview(label70)
        self.scrollView.addSubview(label71)
        self.scrollView.addSubview(label72)
        self.scrollView.addSubview(label73)
        self.scrollView.addSubview(label74)
        self.scrollView.addSubview(label75)
        self.scrollView.addSubview(label76)
        self.scrollView.addSubview(label77)
        self.scrollView.addSubview(label78)
        self.scrollView.addSubview(label79)
        self.scrollView.addSubview(label80)
        self.scrollView.addSubview(label81)
        self.scrollView.addSubview(label82)
        self.scrollView.addSubview(label83)
        self.scrollView.addSubview(label84)
        self.scrollView.addSubview(label85)
        self.scrollView.addSubview(label86)
        self.scrollView.addSubview(label87)
        self.scrollView.addSubview(label88)
        self.scrollView.addSubview(label89)
        self.scrollView.addSubview(label90)
        self.scrollView.addSubview(label91)
        self.scrollView.addSubview(label92)
        self.scrollView.addSubview(label93)
        self.scrollView.addSubview(label94)
        self.scrollView.addSubview(label95)
        self.scrollView.addSubview(label96)
        self.scrollView.addSubview(label97)
        self.scrollView.addSubview(label98)
        self.scrollView.addSubview(label99)
        self.scrollView.addSubview(label100)
        self.scrollView.addSubview(label101)
        self.scrollView.addSubview(label102)
        self.scrollView.addSubview(label103)
        self.scrollView.addSubview(label104)
        self.scrollView.addSubview(label105)
        self.scrollView.addSubview(label106)
        self.scrollView.addSubview(label107)
        self.scrollView.addSubview(label108)
        self.scrollView.addSubview(label109)
        self.scrollView.addSubview(label110)
        self.scrollView.addSubview(label111)
        self.scrollView.addSubview(label112)
        self.scrollView.addSubview(label113)
        self.scrollView.addSubview(label114)
        self.scrollView.addSubview(label115)
        self.scrollView.addSubview(label116)
        self.scrollView.addSubview(label117)
        self.scrollView.addSubview(label118)
        self.scrollView.addSubview(label119)
        self.scrollView.addSubview(label120)
        self.scrollView.addSubview(label121)
        self.scrollView.addSubview(label122)
        self.scrollView.addSubview(label123)
        self.scrollView.addSubview(label124)
        self.scrollView.addSubview(label125)
        self.scrollView.addSubview(label126)
        self.scrollView.addSubview(label127)
        self.scrollView.addSubview(label128)
        self.scrollView.addSubview(label129)
        self.scrollView.addSubview(label130)
        self.scrollView.addSubview(label131)
        self.scrollView.addSubview(label132)
        self.scrollView.addSubview(label133)
        self.scrollView.addSubview(label134)
        self.scrollView.addSubview(label135)
        self.scrollView.addSubview(label136)
        self.scrollView.addSubview(label137)
        self.scrollView.addSubview(label138)
        self.scrollView.addSubview(label139)
        self.scrollView.addSubview(label140)
        self.scrollView.addSubview(label141)
        self.scrollView.addSubview(label142)
        self.scrollView.addSubview(label143)
        self.scrollView.addSubview(label144)
        self.scrollView.addSubview(label145)
        self.scrollView.addSubview(label146)
        self.scrollView.addSubview(label147)
        self.scrollView.addSubview(label148)
        self.scrollView.addSubview(label149)
        self.scrollView.addSubview(label150)
        self.scrollView.addSubview(label151)
        self.scrollView.addSubview(label152)
        self.scrollView.addSubview(label153)
        self.scrollView.addSubview(label154)
        self.scrollView.addSubview(label155)
        self.scrollView.addSubview(label156)
        self.scrollView.addSubview(label157)
        self.scrollView.addSubview(label158)
        self.scrollView.addSubview(label159)
        self.scrollView.addSubview(label160)
        self.scrollView.addSubview(label161)
        self.scrollView.addSubview(label162)
        self.scrollView.addSubview(label163)
        self.scrollView.addSubview(label164)
        self.scrollView.addSubview(label165)
        self.scrollView.addSubview(label166)
        self.scrollView.addSubview(label167)
        self.scrollView.addSubview(label168)
        self.scrollView.addSubview(label169)
        self.scrollView.addSubview(label170)
        self.scrollView.addSubview(label171)
        self.scrollView.addSubview(label172)
        self.scrollView.addSubview(label173)
        self.scrollView.addSubview(label174)
        self.scrollView.addSubview(label175)
        self.scrollView.addSubview(label176)
        self.scrollView.addSubview(label177)
        self.scrollView.addSubview(label178)
        self.scrollView.addSubview(label179)
        self.scrollView.addSubview(label180)
        self.scrollView.addSubview(label181)
        self.scrollView.addSubview(label182)
        self.scrollView.addSubview(label183)
        self.scrollView.addSubview(label184)
        self.scrollView.addSubview(label185)
        self.scrollView.addSubview(label186)
        self.scrollView.addSubview(label187)
        self.scrollView.addSubview(label188)
        self.scrollView.addSubview(label189)
        self.scrollView.addSubview(label190)
        self.scrollView.addSubview(label191)
        self.scrollView.addSubview(label192)
        self.scrollView.addSubview(label193)
        self.scrollView.addSubview(label194)
        self.scrollView.addSubview(label195)
        self.scrollView.addSubview(label196)
        self.scrollView.addSubview(label197)
        self.scrollView.addSubview(label198)
        self.scrollView.addSubview(label199)
        self.scrollView.addSubview(label200)
        self.scrollView.addSubview(label201)
        self.scrollView.addSubview(label202)
        self.scrollView.addSubview(label203)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        label1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6).isActive = true
        label1.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        label2.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 25).isActive = true
        label2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.35).isActive = true
        label2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 12)
        
        label3.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15).isActive = true
        label3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label3.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label4.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 10).isActive = true
        label4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label4.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label5.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 10).isActive = true
        label5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label5.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label5.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label6.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 10).isActive = true
        label6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label6.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label6.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label7.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 10).isActive = true
        label7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label7.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.225).isActive = true
        label7.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label8.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label8.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 15).isActive = true
        label8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.75).isActive = true
        label8.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label8.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label9.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 10).isActive = true
        label9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label9.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label9.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label10.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: 10).isActive = true
        label10.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label10.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label10.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label11.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label11.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: 10).isActive = true
        label11.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label11.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label11.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label12.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label12.topAnchor.constraint(equalTo: label11.bottomAnchor, constant: 10).isActive = true
        label12.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label12.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.325).isActive = true
        label12.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label13.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label13.topAnchor.constraint(equalTo: label12.bottomAnchor, constant: 15).isActive = true
        label13.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.65).isActive = true
        label13.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label13.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label14.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label14.topAnchor.constraint(equalTo: label13.bottomAnchor, constant: 10).isActive = true
        label14.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label14.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label14.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label15.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label15.topAnchor.constraint(equalTo: label14.bottomAnchor, constant: 10).isActive = true
        label15.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label15.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label15.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label16.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label16.topAnchor.constraint(equalTo: label15.bottomAnchor, constant: 10).isActive = true
        label16.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label16.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label16.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label17.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label17.topAnchor.constraint(equalTo: label16.bottomAnchor, constant: 10).isActive = true
        label17.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label17.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.225).isActive = true
        label17.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label18.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label18.topAnchor.constraint(equalTo: label17.bottomAnchor, constant: 15).isActive = true
        label18.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.535).isActive = true
        label18.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label18.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label19.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label19.topAnchor.constraint(equalTo: label18.bottomAnchor, constant: 10).isActive = true
        label19.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label19.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label19.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label20.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label20.topAnchor.constraint(equalTo: label19.bottomAnchor, constant: 10).isActive = true
        label20.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label20.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label20.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label21.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label21.topAnchor.constraint(equalTo: label20.bottomAnchor, constant: 10).isActive = true
        label21.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label21.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label21.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label22.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label22.topAnchor.constraint(equalTo: label21.bottomAnchor, constant: 10).isActive = true
        label22.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label22.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label22.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label23.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label23.topAnchor.constraint(equalTo: label22.bottomAnchor, constant: 15).isActive = true
        label23.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label23.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.095).isActive = true
        label23.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label24.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label24.topAnchor.constraint(equalTo: label23.bottomAnchor, constant: 10).isActive = true
        label24.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label24.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label24.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label25.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label25.topAnchor.constraint(equalTo: label24.bottomAnchor, constant: 10).isActive = true
        label25.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label25.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label25.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label26.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label26.topAnchor.constraint(equalTo: label25.bottomAnchor, constant: 10).isActive = true
        label26.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label26.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label26.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label27.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label27.topAnchor.constraint(equalTo: label26.bottomAnchor, constant: 10).isActive = true
        label27.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label27.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label27.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label199.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label199.topAnchor.constraint(equalTo: label27.bottomAnchor, constant: 15).isActive = true
        label199.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label199.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label199.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label200.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label200.topAnchor.constraint(equalTo: label199.bottomAnchor, constant: 10).isActive = true
        label200.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label200.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label200.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label201.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label201.topAnchor.constraint(equalTo: label200.bottomAnchor, constant: 10).isActive = true
        label201.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label201.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label201.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label202.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label202.topAnchor.constraint(equalTo: label201.bottomAnchor, constant: 10).isActive = true
        label202.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label202.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label202.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label203.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label203.topAnchor.constraint(equalTo: label202.bottomAnchor, constant: 10).isActive = true
        label203.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label203.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.225).isActive = true
        label203.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label28.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label28.topAnchor.constraint(equalTo: label203.bottomAnchor, constant: 15).isActive = true
        label28.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.58).isActive = true
        label28.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label28.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label29.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label29.topAnchor.constraint(equalTo: label28.bottomAnchor, constant: 10).isActive = true
        label29.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label29.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label29.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label30.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label30.topAnchor.constraint(equalTo: label29.bottomAnchor, constant: 10).isActive = true
        label30.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label30.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label30.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label31.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label31.topAnchor.constraint(equalTo: label30.bottomAnchor, constant: 10).isActive = true
        label31.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label31.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label31.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label32.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label32.topAnchor.constraint(equalTo: label31.bottomAnchor, constant: 10).isActive = true
        label32.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label32.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        label32.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label33.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label33.topAnchor.constraint(equalTo: label32.bottomAnchor, constant: 15).isActive = true
        label33.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label33.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label33.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label34.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label34.topAnchor.constraint(equalTo: label33.bottomAnchor, constant: 10).isActive = true
        label34.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label34.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label34.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label35.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label35.topAnchor.constraint(equalTo: label34.bottomAnchor, constant: 10).isActive = true
        label35.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label35.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label35.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label36.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label36.topAnchor.constraint(equalTo: label35.bottomAnchor, constant: 10).isActive = true
        label36.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label36.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label36.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label37.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label37.topAnchor.constraint(equalTo: label36.bottomAnchor, constant: 10).isActive = true
        label37.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label37.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        label37.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label38.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label38.topAnchor.constraint(equalTo: label37.bottomAnchor, constant: 15).isActive = true
        label38.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.45).isActive = true
        label38.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label38.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label39.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label39.topAnchor.constraint(equalTo: label38.bottomAnchor, constant: 10).isActive = true
        label39.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label39.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label39.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label40.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label40.topAnchor.constraint(equalTo: label39.bottomAnchor, constant: 10).isActive = true
        label40.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label40.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label40.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label41.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label41.topAnchor.constraint(equalTo: label40.bottomAnchor, constant: 10).isActive = true
        label41.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label41.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label41.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label42.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label42.topAnchor.constraint(equalTo: label41.bottomAnchor, constant: 10).isActive = true
        label42.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label42.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label42.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label43.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label43.topAnchor.constraint(equalTo: label42.bottomAnchor, constant: 15).isActive = true
        label43.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label43.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.09).isActive = true
        label43.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label44.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label44.topAnchor.constraint(equalTo: label43.bottomAnchor, constant: 10).isActive = true
        label44.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label44.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label44.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label45.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label45.topAnchor.constraint(equalTo: label44.bottomAnchor, constant: 10).isActive = true
        label45.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label45.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label45.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label46.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label46.topAnchor.constraint(equalTo: label45.bottomAnchor, constant: 10).isActive = true
        label46.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label46.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label46.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label47.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label47.topAnchor.constraint(equalTo: label46.bottomAnchor, constant: 10).isActive = true
        label47.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label47.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label47.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label48.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label48.topAnchor.constraint(equalTo: label47.bottomAnchor, constant: 15).isActive = true
        label48.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.54).isActive = true
        label48.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label48.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label49.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label49.topAnchor.constraint(equalTo: label48.bottomAnchor, constant: 10).isActive = true
        label49.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label49.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label49.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label50.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label50.topAnchor.constraint(equalTo: label49.bottomAnchor, constant: 10).isActive = true
        label50.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label50.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label50.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label51.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label51.topAnchor.constraint(equalTo: label50.bottomAnchor, constant: 10).isActive = true
        label51.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label51.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label51.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label52.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label52.topAnchor.constraint(equalTo: label51.bottomAnchor, constant: 10).isActive = true
        label52.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label52.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label52.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label53.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label53.topAnchor.constraint(equalTo: label52.bottomAnchor, constant: 15).isActive = true
        label53.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6).isActive = true
        label53.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label53.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label54.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label54.topAnchor.constraint(equalTo: label53.bottomAnchor, constant: 10).isActive = true
        label54.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label54.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label54.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label55.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label55.topAnchor.constraint(equalTo: label54.bottomAnchor, constant: 10).isActive = true
        label55.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label55.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label55.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label56.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label56.topAnchor.constraint(equalTo: label55.bottomAnchor, constant: 10).isActive = true
        label56.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label56.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label56.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label57.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label57.topAnchor.constraint(equalTo: label56.bottomAnchor, constant: 10).isActive = true
        label57.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label57.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        label57.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label58.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label58.topAnchor.constraint(equalTo: label57.bottomAnchor, constant: 15).isActive = true
        label58.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.75).isActive = true
        label58.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label58.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label59.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label59.topAnchor.constraint(equalTo: label58.bottomAnchor, constant: 10).isActive = true
        label59.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label59.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label59.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label60.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label60.topAnchor.constraint(equalTo: label59.bottomAnchor, constant: 10).isActive = true
        label60.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label60.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label60.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label61.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label61.topAnchor.constraint(equalTo: label60.bottomAnchor, constant: 10).isActive = true
        label61.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label61.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label61.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label62.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label62.topAnchor.constraint(equalTo: label61.bottomAnchor, constant: 10).isActive = true
        label62.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label62.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label62.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label63.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label63.topAnchor.constraint(equalTo: label62.bottomAnchor, constant: 15).isActive = true
        label63.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.65).isActive = true
        label63.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label63.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label64.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label64.topAnchor.constraint(equalTo: label63.bottomAnchor, constant: 10).isActive = true
        label64.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label64.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label64.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label65.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label65.topAnchor.constraint(equalTo: label64.bottomAnchor, constant: 10).isActive = true
        label65.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label65.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label65.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label66.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label66.topAnchor.constraint(equalTo: label65.bottomAnchor, constant: 10).isActive = true
        label66.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label66.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label66.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label67.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label67.topAnchor.constraint(equalTo: label66.bottomAnchor, constant: 10).isActive = true
        label67.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label67.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        label67.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label68.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label68.topAnchor.constraint(equalTo: label67.bottomAnchor, constant: 15).isActive = true
        label68.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.375).isActive = true
        label68.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label68.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label69.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label69.topAnchor.constraint(equalTo: label68.bottomAnchor, constant: 10).isActive = true
        label69.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label69.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label69.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label70.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label70.topAnchor.constraint(equalTo: label69.bottomAnchor, constant: 10).isActive = true
        label70.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label70.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label70.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label71.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label71.topAnchor.constraint(equalTo: label70.bottomAnchor, constant: 10).isActive = true
        label71.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label71.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label71.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label72.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label72.topAnchor.constraint(equalTo: label71.bottomAnchor, constant: 10).isActive = true
        label72.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label72.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        label72.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label73.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label73.topAnchor.constraint(equalTo: label72.bottomAnchor, constant: 15).isActive = true
        label73.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label73.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label73.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label74.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label74.topAnchor.constraint(equalTo: label73.bottomAnchor, constant: 10).isActive = true
        label74.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label74.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label74.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label75.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label75.topAnchor.constraint(equalTo: label74.bottomAnchor, constant: 10).isActive = true
        label75.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label75.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label75.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label76.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label76.topAnchor.constraint(equalTo: label75.bottomAnchor, constant: 10).isActive = true
        label76.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label76.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label76.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label77.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label77.topAnchor.constraint(equalTo: label76.bottomAnchor, constant: 10).isActive = true
        label77.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label77.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label77.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label78.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label78.topAnchor.constraint(equalTo: label77.bottomAnchor, constant: 15).isActive = true
        label78.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label78.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label78.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label79.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label79.topAnchor.constraint(equalTo: label78.bottomAnchor, constant: 10).isActive = true
        label79.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label79.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label79.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label80.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label80.topAnchor.constraint(equalTo: label79.bottomAnchor, constant: 10).isActive = true
        label80.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label80.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label80.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label81.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label81.topAnchor.constraint(equalTo: label80.bottomAnchor, constant: 10).isActive = true
        label81.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label81.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label81.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label82.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label82.topAnchor.constraint(equalTo: label81.bottomAnchor, constant: 10).isActive = true
        label82.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label82.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        label82.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label83.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label83.topAnchor.constraint(equalTo: label82.bottomAnchor, constant: 15).isActive = true
        label83.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label83.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label83.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label84.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label84.topAnchor.constraint(equalTo: label83.bottomAnchor, constant: 10).isActive = true
        label84.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label84.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label84.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label85.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label85.topAnchor.constraint(equalTo: label84.bottomAnchor, constant: 10).isActive = true
        label85.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label85.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label85.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label86.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label86.topAnchor.constraint(equalTo: label85.bottomAnchor, constant: 10).isActive = true
        label86.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label86.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label86.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label87.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label87.topAnchor.constraint(equalTo: label86.bottomAnchor, constant: 10).isActive = true
        label87.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label87.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label87.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label88.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label88.topAnchor.constraint(equalTo: label87.bottomAnchor, constant: 15).isActive = true
        label88.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label88.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label88.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label89.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label89.topAnchor.constraint(equalTo: label88.bottomAnchor, constant: 10).isActive = true
        label89.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label89.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label89.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label90.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label90.topAnchor.constraint(equalTo: label89.bottomAnchor, constant: 10).isActive = true
        label90.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label90.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label90.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label91.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label91.topAnchor.constraint(equalTo: label90.bottomAnchor, constant: 10).isActive = true
        label91.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label91.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label91.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label92.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label92.topAnchor.constraint(equalTo: label91.bottomAnchor, constant: 10).isActive = true
        label92.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label92.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label92.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label93.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label93.topAnchor.constraint(equalTo: label92.bottomAnchor, constant: 15).isActive = true
        label93.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label93.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.085).isActive = true
        label93.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label94.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label94.topAnchor.constraint(equalTo: label93.bottomAnchor, constant: 10).isActive = true
        label94.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label94.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label94.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label95.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label95.topAnchor.constraint(equalTo: label94.bottomAnchor, constant: 10).isActive = true
        label95.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label95.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label95.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label96.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label96.topAnchor.constraint(equalTo: label95.bottomAnchor, constant: 10).isActive = true
        label96.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label96.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label96.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label97.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label97.topAnchor.constraint(equalTo: label96.bottomAnchor, constant: 10).isActive = true
        label97.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label97.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label97.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label98.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label98.topAnchor.constraint(equalTo: label97.bottomAnchor, constant: 15).isActive = true
        label98.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        label98.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label98.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
     
        label99.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label99.topAnchor.constraint(equalTo: label98.bottomAnchor, constant: 10).isActive = true
        label99.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label99.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label99.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label100.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label100.topAnchor.constraint(equalTo: label99.bottomAnchor, constant: 10).isActive = true
        label100.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label100.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label100.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label101.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label101.topAnchor.constraint(equalTo: label100.bottomAnchor, constant: 10).isActive = true
        label101.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label101.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label101.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label102.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label102.topAnchor.constraint(equalTo: label101.bottomAnchor, constant: 10).isActive = true
        label102.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label102.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label102.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label103.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label103.topAnchor.constraint(equalTo: label102.bottomAnchor, constant: 15).isActive = true
        label103.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label103.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label103.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label104.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label104.topAnchor.constraint(equalTo: label103.bottomAnchor, constant: 10).isActive = true
        label104.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label104.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label104.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label105.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label105.topAnchor.constraint(equalTo: label104.bottomAnchor, constant: 10).isActive = true
        label105.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        label105.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label105.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label106.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label106.topAnchor.constraint(equalTo: label105.bottomAnchor, constant: 10).isActive = true
        label106.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label106.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label106.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label107.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label107.topAnchor.constraint(equalTo: label106.bottomAnchor, constant: 10).isActive = true
        label107.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label107.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label107.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label108.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label108.topAnchor.constraint(equalTo: label107.bottomAnchor, constant: 25).isActive = true
        label108.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.55).isActive = true
        label108.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label108.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 12)
        
        label109.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label109.topAnchor.constraint(equalTo: label108.bottomAnchor, constant: 15).isActive = true
        label109.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label109.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label109.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label110.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label110.topAnchor.constraint(equalTo: label109.bottomAnchor, constant: 10).isActive = true
        label110.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label110.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label110.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
    
        label111.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label111.topAnchor.constraint(equalTo: label110.bottomAnchor, constant: 10).isActive = true
        label111.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label111.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label111.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label112.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label112.topAnchor.constraint(equalTo: label111.bottomAnchor, constant: 10).isActive = true
        label112.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label112.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label112.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label113.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label113.topAnchor.constraint(equalTo: label112.bottomAnchor, constant: 10).isActive = true
        label113.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label113.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.5).isActive = true
        label113.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label114.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label114.topAnchor.constraint(equalTo: label113.bottomAnchor, constant: 15).isActive = true
        label114.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label114.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.18).isActive = true
        label114.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label115.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label115.topAnchor.constraint(equalTo: label114.bottomAnchor, constant: 10).isActive = true
        label115.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label115.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label115.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label116.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label116.topAnchor.constraint(equalTo: label115.bottomAnchor, constant: 10).isActive = true
        label116.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.32).isActive = true
        label116.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label116.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label117.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label117.topAnchor.constraint(equalTo: label116.bottomAnchor, constant: 10).isActive = true
        label117.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.55).isActive = true
        label117.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label117.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label118.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label118.topAnchor.constraint(equalTo: label117.bottomAnchor, constant: 10).isActive = true
        label118.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label118.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.4).isActive = true
        label118.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label119.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label119.topAnchor.constraint(equalTo: label118.bottomAnchor, constant: 15).isActive = true
        label119.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label119.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label119.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
     
        label120.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label120.topAnchor.constraint(equalTo: label119.bottomAnchor, constant: 10).isActive = true
        label120.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label120.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label120.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label121.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label121.topAnchor.constraint(equalTo: label120.bottomAnchor, constant: 10).isActive = true
        label121.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.32).isActive = true
        label121.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label121.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label122.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label122.topAnchor.constraint(equalTo: label121.bottomAnchor, constant: 10).isActive = true
        label122.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.55).isActive = true
        label122.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label122.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label123.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label123.topAnchor.constraint(equalTo: label122.bottomAnchor, constant: 10).isActive = true
        label123.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label123.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.4).isActive = true
        label123.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label124.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label124.topAnchor.constraint(equalTo: label123.bottomAnchor, constant: 15).isActive = true
        label124.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label124.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.095).isActive = true
        label124.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label125.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label125.topAnchor.constraint(equalTo: label124.bottomAnchor, constant: 10).isActive = true
        label125.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label125.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label125.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label126.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label126.topAnchor.constraint(equalTo: label125.bottomAnchor, constant: 10).isActive = true
        label126.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label126.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label126.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label127.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label127.topAnchor.constraint(equalTo: label126.bottomAnchor, constant: 10).isActive = true
        label127.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        label127.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        label127.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label128.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label128.topAnchor.constraint(equalTo: label127.bottomAnchor, constant: 10).isActive = true
        label128.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label128.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label128.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label129.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label129.topAnchor.constraint(equalTo: label128.bottomAnchor, constant: 15).isActive = true
        label129.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label129.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.06).isActive = true
        label129.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label130.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label130.topAnchor.constraint(equalTo: label129.bottomAnchor, constant: 10).isActive = true
        label130.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label130.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label130.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label131.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label131.topAnchor.constraint(equalTo: label130.bottomAnchor, constant: 10).isActive = true
        label131.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label131.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label131.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label132.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label132.topAnchor.constraint(equalTo: label131.bottomAnchor, constant: 10).isActive = true
        label132.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label132.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label132.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label133.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label133.topAnchor.constraint(equalTo: label132.bottomAnchor, constant: 10).isActive = true
        label133.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label133.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        label133.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label134.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label134.topAnchor.constraint(equalTo: label133.bottomAnchor, constant: 15).isActive = true
        label134.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label134.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.135).isActive = true
        label134.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label135.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label135.topAnchor.constraint(equalTo: label134.bottomAnchor, constant: 10).isActive = true
        label135.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label135.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label135.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label136.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label136.topAnchor.constraint(equalTo: label135.bottomAnchor, constant: 10).isActive = true
        label136.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label136.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label136.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label137.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label137.topAnchor.constraint(equalTo: label136.bottomAnchor, constant: 10).isActive = true
        label137.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label137.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label137.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label138.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label138.topAnchor.constraint(equalTo: label137.bottomAnchor, constant: 10).isActive = true
        label138.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label138.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.35).isActive = true
        label138.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label139.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label139.topAnchor.constraint(equalTo: label138.bottomAnchor, constant: 15).isActive = true
        label139.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label139.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.09).isActive = true
        label139.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label140.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label140.topAnchor.constraint(equalTo: label139.bottomAnchor, constant: 10).isActive = true
        label140.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label140.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label140.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label141.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label141.topAnchor.constraint(equalTo: label140.bottomAnchor, constant: 10).isActive = true
        label141.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label141.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label141.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label142.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label142.topAnchor.constraint(equalTo: label141.bottomAnchor, constant: 10).isActive = true
        label142.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label142.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label142.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label143.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label143.topAnchor.constraint(equalTo: label142.bottomAnchor, constant: 10).isActive = true
        label143.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label143.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.4).isActive = true
        label143.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label144.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label144.topAnchor.constraint(equalTo: label143.bottomAnchor, constant: 15).isActive = true
        label144.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.75).isActive = true
        label144.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.07).isActive = true
        label144.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label145.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label145.topAnchor.constraint(equalTo: label144.bottomAnchor, constant: 10).isActive = true
        label145.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label145.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label145.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label146.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label146.topAnchor.constraint(equalTo: label145.bottomAnchor, constant: 10).isActive = true
        label146.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label146.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label146.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label147.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label147.topAnchor.constraint(equalTo: label146.bottomAnchor, constant: 10).isActive = true
        label147.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7).isActive = true
        label147.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label147.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label148.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label148.topAnchor.constraint(equalTo: label147.bottomAnchor, constant: 10).isActive = true
        label148.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label148.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.4).isActive = true
        label148.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label149.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label149.topAnchor.constraint(equalTo: label148.bottomAnchor, constant: 15).isActive = true
        label149.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        label149.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.065).isActive = true
        label149.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label150.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label150.topAnchor.constraint(equalTo: label149.bottomAnchor, constant: 10).isActive = true
        label150.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label150.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label150.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label151.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label151.topAnchor.constraint(equalTo: label150.bottomAnchor, constant: 10).isActive = true
        label151.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label151.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label151.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label152.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label152.topAnchor.constraint(equalTo: label151.bottomAnchor, constant: 10).isActive = true
        label152.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label152.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label152.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label153.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label153.topAnchor.constraint(equalTo: label152.bottomAnchor, constant: 10).isActive = true
        label153.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label153.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        label153.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label154.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label154.topAnchor.constraint(equalTo: label153.bottomAnchor, constant: 15).isActive = true
        label154.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.675).isActive = true
        label154.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label154.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label155.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label155.topAnchor.constraint(equalTo: label154.bottomAnchor, constant: 10).isActive = true
        label155.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label155.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label155.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label156.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label156.topAnchor.constraint(equalTo: label155.bottomAnchor, constant: 10).isActive = true
        label156.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label156.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label156.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label157.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label157.topAnchor.constraint(equalTo: label156.bottomAnchor, constant: 10).isActive = true
        label157.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label157.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label157.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label158.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label158.topAnchor.constraint(equalTo: label157.bottomAnchor, constant: 10).isActive = true
        label158.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label158.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15).isActive = true
        label158.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label159.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label159.topAnchor.constraint(equalTo: label158.bottomAnchor, constant: 15).isActive = true
        label159.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label159.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label159.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
     
        label160.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label160.topAnchor.constraint(equalTo: label159.bottomAnchor, constant: 10).isActive = true
        label160.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label160.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label160.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label161.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label161.topAnchor.constraint(equalTo: label160.bottomAnchor, constant: 10).isActive = true
        label161.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label161.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label161.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label162.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label162.topAnchor.constraint(equalTo: label161.bottomAnchor, constant: 10).isActive = true
        label162.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label162.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label162.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label163.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label163.topAnchor.constraint(equalTo: label162.bottomAnchor, constant: 10).isActive = true
        label163.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label163.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        label163.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label164.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label164.topAnchor.constraint(equalTo: label163.bottomAnchor, constant: 15).isActive = true
        label164.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label164.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.09).isActive = true
        label164.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label165.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label165.topAnchor.constraint(equalTo: label164.bottomAnchor, constant: 10).isActive = true
        label165.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label165.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label165.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label166.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label166.topAnchor.constraint(equalTo: label165.bottomAnchor, constant: 10).isActive = true
        label166.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label166.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label166.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label167.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label167.topAnchor.constraint(equalTo: label166.bottomAnchor, constant: 10).isActive = true
        label167.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label167.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label167.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label168.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label168.topAnchor.constraint(equalTo: label167.bottomAnchor, constant: 10).isActive = true
        label168.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label168.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        label168.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label169.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label169.topAnchor.constraint(equalTo: label168.bottomAnchor, constant: 15).isActive = true
        label169.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7).isActive = true
        label169.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label169.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label170.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label170.topAnchor.constraint(equalTo: label169.bottomAnchor, constant: 10).isActive = true
        label170.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label170.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label170.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label171.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label171.topAnchor.constraint(equalTo: label170.bottomAnchor, constant: 10).isActive = true
        label171.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label171.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label171.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label172.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label172.topAnchor.constraint(equalTo: label171.bottomAnchor, constant: 10).isActive = true
        label172.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label172.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label172.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label173.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label173.topAnchor.constraint(equalTo: label172.bottomAnchor, constant: 10).isActive = true
        label173.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label173.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2).isActive = true
        label173.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label174.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label174.topAnchor.constraint(equalTo: label173.bottomAnchor, constant: 15).isActive = true
        label174.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7).isActive = true
        label174.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.09).isActive = true
        label174.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label175.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label175.topAnchor.constraint(equalTo: label174.bottomAnchor, constant: 10).isActive = true
        label175.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label175.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label175.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label176.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label176.topAnchor.constraint(equalTo: label175.bottomAnchor, constant: 10).isActive = true
        label176.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label176.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label176.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label177.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label177.topAnchor.constraint(equalTo: label176.bottomAnchor, constant: 10).isActive = true
        label177.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label177.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label177.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label178.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label178.topAnchor.constraint(equalTo: label177.bottomAnchor, constant: 10).isActive = true
        label178.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label178.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        label178.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label179.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label179.topAnchor.constraint(equalTo: label178.bottomAnchor, constant: 15).isActive = true
        label179.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8).isActive = true
        label179.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label179.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label180.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label180.topAnchor.constraint(equalTo: label179.bottomAnchor, constant: 10).isActive = true
        label180.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label180.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label180.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label181.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label181.topAnchor.constraint(equalTo: label180.bottomAnchor, constant: 10).isActive = true
        label181.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label181.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label181.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label182.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label182.topAnchor.constraint(equalTo: label181.bottomAnchor, constant: 10).isActive = true
        label182.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label182.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label182.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label183.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label183.topAnchor.constraint(equalTo: label182.bottomAnchor, constant: 10).isActive = true
        label183.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label183.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.4).isActive = true
        label183.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label184.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label184.topAnchor.constraint(equalTo: label183.bottomAnchor, constant: 15).isActive = true
        label184.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.55).isActive = true
        label184.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label184.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)

        label185.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label185.topAnchor.constraint(equalTo: label184.bottomAnchor, constant: 10).isActive = true
        label185.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label185.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label185.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label186.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label186.topAnchor.constraint(equalTo: label185.bottomAnchor, constant: 10).isActive = true
        label186.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label186.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label186.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label187.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label187.topAnchor.constraint(equalTo: label186.bottomAnchor, constant: 10).isActive = true
        label187.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label187.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label187.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label188.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label188.topAnchor.constraint(equalTo: label187.bottomAnchor, constant: 10).isActive = true
        label188.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label188.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.35).isActive = true
        label188.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label189.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label189.topAnchor.constraint(equalTo: label188.bottomAnchor, constant: 25).isActive = true
        label189.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        label189.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label189.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 12)
        
        label190.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label190.topAnchor.constraint(equalTo: label189.bottomAnchor, constant: 15).isActive = true
        label190.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.75).isActive = true
        label190.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        label190.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label191.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label191.topAnchor.constraint(equalTo: label190.bottomAnchor, constant: 10).isActive = true
        label191.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        label191.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label191.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label192.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label192.topAnchor.constraint(equalTo: label191.bottomAnchor, constant: 10).isActive = true
        label192.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label192.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label192.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
     
        label193.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label193.topAnchor.constraint(equalTo: label192.bottomAnchor, constant: 10).isActive = true
        label193.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label193.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        label193.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label194.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label194.topAnchor.constraint(equalTo: label193.bottomAnchor, constant: 15).isActive = true
        label194.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.35).isActive = true
        label194.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        label194.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 16)
        
        label195.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label195.topAnchor.constraint(equalTo: label194.bottomAnchor, constant: 10).isActive = true
        label195.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.25).isActive = true
        label195.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label195.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label196.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label196.topAnchor.constraint(equalTo: label195.bottomAnchor, constant: 10).isActive = true
        label196.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.285).isActive = true
        label196.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        label196.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label197.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label197.topAnchor.constraint(equalTo: label196.bottomAnchor, constant: 10).isActive = true
        label197.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        label197.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        label197.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label198.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 25).isActive = true
        label198.topAnchor.constraint(equalTo: label197.bottomAnchor, constant: 10).isActive = true
        label198.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        label198.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        label198.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
    }
    
    // start on new boxes with label 109
    // 110
    // 111 // 116 for constraints if 1.5 hours is selected for width constraint
    // 112
    // ends on label 113
    
    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true)
    }
    
}

//
//  AboutUsViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/11/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
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
        
        label.text = "About GSDA"
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
        
        label.text = "❃ Philosophy"
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
    
    let label3: UILabel = {
        let label = UILabel()
        
        label.text = "There are many job opportunities for the qualified dental assistants to assist dentists in the dental profession. Although one desires to be trained in this profession, however, there are challenges that prevent them from attending school. It is difficult for most people to attend school on a full time basis because they have to work to earn a living. The expense necessary to finance schooling in a major college is also another reason most people are discouraged in pursuing further education. We feel that the dental assisting program offered at our school will meet these challenges. The nighttime or weekend class schedules are designed to accommodate working students. The very affordable tuition fee will also solve the financing issues for most prospective students. Students are accepted regardless of sex, race, age, marital status, religious creed, ethnic or national origin."
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
        
        label.text = "The Dental Assisting Curriculum is an instructional program providing a twelve-week Dental Assisting Course consisting of 78 hours of lecture and lab and a 50 hour externship with a practicing dentist. The program utilizes a hands-on educational approach where students learn by doing. The course includes lectures on fundamentals of general dentistry and the basic skills, knowledge and technical proficiency necessary to assist the dentist in the various operative procedures performed in a dental clinic. Completion of the program will allow the student to have enough training to qualify for an entry level position in a dental office."
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
        
        label.text = "The Georgia School of Dental Assisting, LLC. is dedicated to the ideals of developing efficient, effective dental assistants through a competency-based program."
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
        
        label.text = "Mission Statement"
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
    
    let label7: UILabel = {
        let label = UILabel()
        
        label.text = "Everything we do is inspired by our commitment to our students:"
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
        
        label.text = "✔︎ To instill personal responsibilities in oral health care"
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
        
        label.text = "✔︎ To enhance personal worth, self sufficiency and positive self-esteem"
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
        
        label.text = "✔︎ To provide quality service to the dental profession"
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
        
        label.text = "✔︎ To be one of the best center of learning in the dental assisting profession"
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
        
        label.text = "History"
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
    
    let label13: UILabel = {
        let label = UILabel()
        
        label.text = "The Georgia School of Dental Assisting, LLC is an institution developed as an effort of Dr. Igor Reizenson & Dr. Alla Alpert. Dr. Reizenson & Dr Alpert recognized the need for well-trained, efficient chairside dental assistants and found difficulty in attracting good assistants throughout their years in practice. Georgia School of Dental Assisting will help prepare interested persons in becoming part of the dental profession and assuming a position as a well-respected professional."
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
    
    lazy var FacultyAndStaffButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Faculty & Staff", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleFacultyAndStaff), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var testimonialsButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Testimonials", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleTestimonials), for: .touchUpInside)
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
        navigationItem.title = "AboutUsViewController"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1900)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 2175)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 2375)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 2600)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 2850)
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
        self.scrollView.addSubview(FacultyAndStaffButton)
        self.scrollView.addSubview(testimonialsButton)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 8)
        
        label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 25).isActive = true
        label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 14)
        
        label3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 25).isActive = true
        label3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        label3.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label4.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 15).isActive = true
        label4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        label4.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 15).isActive = true
        label5.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label5.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        label5.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
    
        label6.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 25).isActive = true
        label6.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        label6.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06).isActive = true
        label6.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 14)
        
        label7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 15).isActive = true
        label7.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        label7.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        label7.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label8.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 15).isActive = true
        label8.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        label8.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        label8.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label9.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 15).isActive = true
        label9.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        label9.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        label9.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label10.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: 15).isActive = true
        label10.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        label10.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        label10.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label11.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label11.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: 15).isActive = true
        label11.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        label11.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        label11.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        label12.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label12.topAnchor.constraint(equalTo: label11.bottomAnchor, constant: 25).isActive = true
        label12.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        label12.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06).isActive = true
        label12.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 14)
        
        label13.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label13.topAnchor.constraint(equalTo: label12.bottomAnchor, constant: 15).isActive = true
        label13.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label13.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        label13.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        FacultyAndStaffButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        FacultyAndStaffButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        FacultyAndStaffButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        FacultyAndStaffButton.topAnchor.constraint(equalTo: label13.bottomAnchor, constant: 15).isActive = true
        
        testimonialsButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        testimonialsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        testimonialsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        testimonialsButton.topAnchor.constraint(equalTo: FacultyAndStaffButton.bottomAnchor, constant: 15).isActive = true
        
    }
    
    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true)
    }
    
    @objc func handleFacultyAndStaff() {
        previousVC = "AboutVC"
        UserDefaults.standard.set("AboutVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(FacultyAndStaffViewController(), animated: true)
    }
    
    @objc func handleTestimonials() {
        previousVC = "AboutVC"
        UserDefaults.standard.set("AboutVC", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(TestimonialsViewController(), animated: true)
    }

}

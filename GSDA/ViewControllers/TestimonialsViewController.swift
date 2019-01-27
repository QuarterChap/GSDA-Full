//
//  TestimonialsViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/27/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class TestimonialsViewController: UIViewController {

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
        
        label.text = "Testimonials"
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
    
    let quote1: UILabel = {
        let label = UILabel()
        
        label.text = "✔︎"
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
        
        label.text = "By far, the best dental assisting school in Atlanta. You have to learn from the best to be the best and they are truly the best. I am a former student and soon to be dental hygienist thanks to GSDA, I love to make people feel good about smiling."
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
        
        label.text = "Rosetta"
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
        
        label.text = "Alumni"
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
    
    let quote2: UILabel = {
        let label = UILabel()
        
        label.text = "✔︎"
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
        
        label.text = "Choosing the Georgia School of Dental Assisting was by far the best choice I’ve ever made. I can’t give enough positive feedback. Dusti and Morgan are VERY knowledgeable and have inspired me to be the best that I can be. I feel confident and ready to pursue my new career because I’ve learned from the best! The instructors really made me feel comfortable with learning new things and will do everything they can to help each and every student!"
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
        
        label.text = "Shannon"
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
        
        label.text = "Alumni"
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
    
    let quote3: UILabel = {
        let label = UILabel()
        
        label.text = "✔︎"
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
        
        label.text = "The BEST dental assisting school in Atlanta,Georgia.They have a wonderful program with detailed books and lectures and a lot of training in a clinical environment that helps you to understand what you are learning in the classroom. They are the nicest people and also help you find a job!"
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
        
        label.text = "Afsanea"
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
        
        label.text = "Alumni"
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
        
        label.text = "Reviews on Facebook"
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
    
    lazy var reviewsButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Read Facebook Reviews", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleReviews), for: .touchUpInside)
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
        navigationItem.title = "FacultyAndStaffViewController"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1250)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1425)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1550)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1650)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1775)
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
        self.scrollView.addSubview(quote1)
        self.scrollView.addSubview(label2)
        self.scrollView.addSubview(label3)
        self.scrollView.addSubview(label4)
        self.scrollView.addSubview(quote2)
        self.scrollView.addSubview(label5)
        self.scrollView.addSubview(label6)
        self.scrollView.addSubview(label7)
        self.scrollView.addSubview(quote3)
        self.scrollView.addSubview(label8)
        self.scrollView.addSubview(label9)
        self.scrollView.addSubview(label10)
        self.scrollView.addSubview(label11)
        self.scrollView.addSubview(reviewsButton)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        quote1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        quote1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 50).isActive = true
        quote1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        quote1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        quote1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 8)
        
        label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: quote1.bottomAnchor, constant: 15).isActive = true
        label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label3.leftAnchor.constraint(equalTo: label2.leftAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15).isActive = true
        label3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        label3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label3.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 21)
        
        label4.leftAnchor.constraint(equalTo: label3.leftAnchor).isActive = true
        label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 10).isActive = true
        label4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        label4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label4.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        quote2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        quote2.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 50).isActive = true
        quote2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        quote2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        quote2.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 8)
        
        label5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label5.topAnchor.constraint(equalTo: quote2.bottomAnchor, constant: 15).isActive = true
        label5.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label5.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.375).isActive = true
        label5.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label6.leftAnchor.constraint(equalTo: label2.leftAnchor).isActive = true
        label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 15).isActive = true
        label6.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        label6.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label6.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 21)
        
        label7.leftAnchor.constraint(equalTo: label3.leftAnchor).isActive = true
        label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 10).isActive = true
        label7.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        label7.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label7.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        quote3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        quote3.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 50).isActive = true
        quote3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        quote3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        quote3.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 8)
        
        label8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label8.topAnchor.constraint(equalTo: quote3.bottomAnchor, constant: 15).isActive = true
        label8.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label8.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.275).isActive = true
        label8.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label9.leftAnchor.constraint(equalTo: label2.leftAnchor).isActive = true
        label9.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 15).isActive = true
        label9.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        label9.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label9.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 21)
        
        label10.leftAnchor.constraint(equalTo: label3.leftAnchor).isActive = true
        label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: 10).isActive = true
        label10.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        label10.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        label10.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 21)
        
        label11.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label11.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: 25).isActive = true
        label11.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        label11.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        label11.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 16)
        
        reviewsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        reviewsButton.topAnchor.constraint(equalTo: label11.bottomAnchor, constant: 10).isActive = true
        reviewsButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        reviewsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        reviewsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
    }
    
    // quote 1 to lbl4
    
    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true)
    }

    @objc func handleReviews() {
        guard let url = URL(string: "https://www.facebook.com/pg/GSDAroswellkennesaw/reviews/") else { return }
        UIApplication.shared.open(url)
    }
    
    @objc func handleBack() {
        self.present(AboutUsViewController(), animated: true)
    }
    
}

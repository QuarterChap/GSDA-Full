//
//  ExpandedDutyViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/28/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class ExpandedDutyViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Expanded Duty"
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        return label
    }()
    
    let ourApprovalLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Our Approval"
        label.textColor = UIColor(r: 124, g: 128, b: 49)
        label.textAlignment = .center
        
        return label
    }()
    
    let ourApprovalButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("View Curriculum", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleViewPDF), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    let affidavitFormLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Affidavit Form"
        label.textColor = UIColor(r: 124, g: 128, b: 49)
        label.textAlignment = .center
        
        return label
    }()
    
    let affidavitButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("Download Affidavit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleAffidavitForm), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    let enrollLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enroll Now"
        label.textColor = UIColor(r: 124, g: 128, b: 49)
        label.textAlignment = .center
        
        return label
    }()
    
    let enrollButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(r: 124, g: 128, b: 49)
        button.setTitle("Enroll Now", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleEnrollNow), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "ExpandedDutyViewController"
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(ourApprovalLabel)
        view.addSubview(ourApprovalButton)
        view.addSubview(affidavitFormLabel)
        view.addSubview(affidavitButton)
        view.addSubview(enrollLabel)
        view.addSubview(enrollButton)
        
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.05).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        ourApprovalLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.frame.height * 0.05).isActive = true
        ourApprovalLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        ourApprovalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ourApprovalLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        ourApprovalLabel.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        ourApprovalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ourApprovalButton.topAnchor.constraint(equalTo: ourApprovalLabel.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        ourApprovalButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        ourApprovalButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        affidavitFormLabel.topAnchor.constraint(equalTo: ourApprovalButton.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        affidavitFormLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        affidavitFormLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        affidavitFormLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        affidavitFormLabel.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
       affidavitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        affidavitButton.topAnchor.constraint(equalTo: affidavitFormLabel.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        affidavitButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        affidavitButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        enrollLabel.topAnchor.constraint(equalTo: affidavitButton.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        enrollLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        enrollLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enrollLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        enrollLabel.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)
        
        enrollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enrollButton.topAnchor.constraint(equalTo: enrollLabel.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        enrollButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        enrollButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true, completion: {})
    }
    
    @objc func handleViewPDF() {
        
    }
    
    @objc func handleAffidavitForm() {
        
    }
    
    @objc func handleEnrollNow() {
        self.present(EnrollExpandedDuty(), animated: true, completion: {})
    }
    
}

//
//  ExpandedDutyViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/28/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class ExpandedDutyViewController: UIViewController {
    
    let ourApprovalLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Our Approval"
        label.textColor = .myBlue
        label.textAlignment = .center
        
        return label
    }()
    
    let ourApprovalButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = .myBlue
        button.setTitle("View Curriculum", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleViewPDF), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        return button
    }()
    
    let affidavitFormLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Affidavit Form"
        label.textColor = .myBlue
        label.textAlignment = .center
        
        return label
    }()
    
    let affidavitButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .myBlue
        button.setTitle("Download Affidavit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleAffidavitForm), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    let enrollLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enroll Now"
        label.textColor = .myBlue
        label.textAlignment = .center
        
        return label
    }()
    
    let enrollButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .myBlue
        button.setTitle("Enroll Now", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleEnrollNow), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        navigationItem.title = "EXPANDED DUTY"
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(ourApprovalLabel)
        view.addSubview(ourApprovalButton)
        view.addSubview(affidavitFormLabel)
        view.addSubview(affidavitButton)
        view.addSubview(enrollLabel)
        view.addSubview(enrollButton)
        
        
        ourApprovalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.05).isActive = true
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
    
    @objc func handleViewPDF() {
        
    }
    
    @objc func handleAffidavitForm() {
        
    }
    
    @objc func handleEnrollNow() {
        navigationController?.pushViewController(ExpandedDutyViewController(), animated: true)
    }
    
}

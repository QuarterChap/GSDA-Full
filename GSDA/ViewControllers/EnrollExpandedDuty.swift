//
//  EnrollExpandedDuty.swift
//  GSDA
//
//  Created by Julian Cearley on 2/19/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class EnrollExpandedDuty: UIViewController {
    
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enroll In Expanded Duty"
        label.textColor = UIColor(r: 166, g: 210, b: 253)
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        self.view.addSubview(backButton)
        
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
    }
    
    func setupScrollView() {
        scrollView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.05).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.075)    }
    
    @objc func handleBack() {
        self.dismiss(animated: true) {}
    }
    
}

//
//  AccountSettingsViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/31/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
import Firebase

class AccountSettingsViewController: UIViewController {
    
    var signedIn = UserDefaults.standard.bool(forKey: "signedIn")
    
    lazy var logoutButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = .myBlue
        button.setTitle("LOGOUT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "SETTINGS"
        
        setupView()
    }
    
    func setupView() {
        view.addSubview(logoutButton)
        
        logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        logoutButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true, completion: {})
    }
    
    @objc func logoutAction() {
        signedIn = false
        UserDefaults.standard.set(false, forKey: "signedIn")
        UserDefaults.standard.synchronize()
        
        try! Auth.auth().signOut()
        
        self.present(LoginViewController(), animated: true) {}
        // maybe change this to dismiss all??
        // test it later
    }
}

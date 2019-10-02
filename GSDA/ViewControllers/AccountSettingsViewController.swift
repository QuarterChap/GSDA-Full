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
    
<<<<<<< HEAD
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
    
    //
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "⚙️ Account Settings"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
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
    
=======
>>>>>>> 63f06595bef31882618ae952c2062f74f08723bd
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
    
    let textField = UITextField().configured {
        $0.placeholder = "admin email"
        $0.backgroundColor = .myBlue
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .white
    }
    
    let registerAdminButton = UIButton().configured {
        $0.setTitle("REGISTER ADMIN", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .myBlue
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(registerAdminButtonPressed), for: .touchUpInside)
    }
    
    @objc func registerAdminButtonPressed() {
        guard let email = textField.text else {
            return
        }
        HelperService.addAdmin(with: email)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "SETTINGS"
        setupView()
        updateView()
    }
    
    var isAdmin = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserApi().isUserAdmin { (isAdmin) in
            self.isAdmin = isAdmin
            self.updateView()
        }
    }
    
    func updateView() {
        textField.isHidden = !isAdmin
        registerAdminButton.isHidden = !isAdmin
    }
    
    func setupView() {
        view.addSubview(textField)
        view.addSubview(registerAdminButton)
        view.addSubview(logoutButton)

        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        registerAdminButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        registerAdminButton.leadingAnchor.constraint(equalTo: logoutButton.leadingAnchor).isActive = true
        registerAdminButton.trailingAnchor.constraint(equalTo: logoutButton.trailingAnchor).isActive = true
        registerAdminButton.heightAnchor.constraint(equalTo: logoutButton.heightAnchor).isActive = true
        
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

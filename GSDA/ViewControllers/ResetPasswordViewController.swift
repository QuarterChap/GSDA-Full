//
//  ResetPasswordViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/9/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let instructionsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Enter your email, tap reset then check email for reset link."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let inputsContainerView: UIView =  {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.white
        button.setTitle("Reset", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.white
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ViewController"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        
        self.view.addSubview(logo)
        self.view.addSubview(inputsContainerView)
        self.view.addSubview(resetButton)
        self.view.addSubview(backButton)
        self.view.addSubview(instructionsLbl)
        self.view.addSubview(logoImageView)
        
        setupView()
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setupView() {
        
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 50)
        inputsContainerViewHeightAnchor?.isActive  = true
        
        inputsContainerView.addSubview(emailTextField)
        
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo:  inputsContainerView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1)
        emailTextFieldHeightAnchor?.isActive = true
        emailTextField.autocapitalizationType = UITextAutocapitalizationType.none
        
        resetButton.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 10).isActive = true
        resetButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        resetButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -25).isActive = true
        logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        logo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        backButton.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        
        instructionsLbl.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        instructionsLbl.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10).isActive = true
        instructionsLbl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        instructionsLbl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        instructionsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.065)
        
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -(view.frame.height * 0.1)).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    @objc func handleReset() {
        if self.emailTextField.text != "" {
            Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { error in
                self.emailTextField.text = ""
                let alert = UIAlertController(title: "Check Email For Reset Verification", message: error as? String, preferredStyle: .alert)
                //alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (nil) in
                    self.present(LoginViewController(), animated: true) {}
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true, completion: {})
    }
    
}

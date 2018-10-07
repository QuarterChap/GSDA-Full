//
//  ViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 8/30/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
//    let RoswellLocationLabel: UILabel = {
//        let label = UILabel()
//        
//        label.text = "Roswell"
//        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
//        label.textColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        
//        return label
//    }()
//    
//    let KennesawLocationLabel: UILabel = {
//        let label = UILabel()
//
//        label.text = "Kennesaw"
//        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
//        label.textColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//
//        return label
//    }()
//
//    let WoodstockLocationLabel: UILabel = {
//        let label = UILabel()
//
//        label.text = "Woodstock"
//        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
//        label.textColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//
//        return label
//    }()
//
//    let mottoLabel: UILabel = {
//        let label = UILabel()
//
//        label.text = "Just twelve weeks to a new career!"
//        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
//        label.textColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//
//        return label
//    }()
//
//    let inputsContainerView: UIView =  {
//        let view = UIView()
//        view.backgroundColor = UIColor.white
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 5
//        view.layer.masksToBounds = true
//        return view
//    }()
//
//    lazy var loginRegisterButton: UIButton = {
//        let button = UIButton(type:  .system)
//        button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
//        button.setTitle("Login", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        button.layer.cornerRadius = 5
//        button.layer.masksToBounds = true
//        button.addTarget(self, action: #selector(handleLoginRegistration), for: .touchUpInside)
//
//        return button
//    }()
//    
//    let emailTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Email"
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    let emailSepartorView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(r: 220 , g: 220, b: 220)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    let passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Password"
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.isSecureTextEntry = true
//        return textField
//    }()
//
//    let logoImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "GSDALogo")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//
//    lazy var  loginRegisterSegmentedControl: UISegmentedControl = {
//        let sc = UISegmentedControl(items: [ "Login", "Register"])
//        sc.translatesAutoresizingMaskIntoConstraints = false
//        sc.tintColor = UIColor.white
//        sc.selectedSegmentIndex = 0
//        sc.addTarget(self, action: #selector(loginRegisterChange) , for: .valueChanged)
//        return sc
//    }()
//
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
//        view.backgroundColor = UIColor(r: 145, g: 183, b: 219)
//        
//        view.addSubview(inputsContainerView)
//        view.addSubview(loginRegisterButton)
//        view.addSubview(logoImageView)
//        view.addSubview(loginRegisterSegmentedControl)
//        view.addSubview(mottoLabel)
//        view.addSubview(RoswellLocationLabel)
//        view.addSubview(WoodstockLocationLabel)
//        view.addSubview(KennesawLocationLabel)
//
//        setupInputsContainerView()
//        setupLoginRegisterButton()
//        setupLogoImageView()
//        setupLoginRegisterSegmentedControl()
//        setupMottoLabel()
//        setupLocationLabels()
    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//
//    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
//    var emailTextFieldHeightAnchor: NSLayoutConstraint?
//    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
//
//    @objc func loginRegisterChange() {
//        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
//        loginRegisterButton.setTitle(title, for: .normal)
//
//        //change height of inputContainerView
//        inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 100
//
//        // change height of nameTextField
//        emailTextFieldHeightAnchor?.isActive = false
//        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/2)
//        emailTextFieldHeightAnchor?.isActive = true
//
//        passwordTextFieldHeightAnchor?.isActive = false
//        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/2)
//        passwordTextFieldHeightAnchor?.isActive = true
//    }
//
//    @objc func handleLoginRegistration() {
//        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
//            if let email = emailTextField.text, let password = passwordTextField.text, ((emailTextField.text?.count)! > 0 && (passwordTextField.text?.count)! > 0) {
//
//                AuthService.instance.login(email: email, password: password) { (error, data) in
//                    guard error == nil else {
//                        let alert = UIAlertController(title: "Error Authentication", message: error, preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                        self.present(alert, animated: true, completion: nil)
//                        return;
//                    }
//                    if error == nil {
//                        print("Login Successful")
//                        let mmvc = MainMenuViewController() as UIViewController
//                        self.navigationController?.pushViewController(mmvc, animated: true)
//                    } else {
//                        let alert = UIAlertController(title: "Username and Password Required", message: "You Must Enter a Username and Password", preferredStyle: .alert)
//
//                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }
//            }
//            // This is where I ended the login in part of this func!
//        } else if loginRegisterSegmentedControl.selectedSegmentIndex == 1 {
//            // register
//            print("Register Button Pressed")
//
//            if let email = emailTextField.text, let password = passwordTextField.text, (email.count > 0 && password.count > 0) {
//                AuthService.instance.SignUpUser(email: email, password: password, firstname: "Douglas", lastname: "Spencer", username: "dspencer") { (error, data) in
//                    if error != nil {
//                        debugPrint(error)
//                    } else {
//                        debugPrint("Success")
//                    }
//                }
//            }
//        }
//    }
//
//    func setupLoginRegisterSegmentedControl() {
//        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
//        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
//    }
//
//    func setupLocationLabels() {
//        WoodstockLocationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        WoodstockLocationLabel.topAnchor.constraint(equalTo: loginRegisterButton.bottomAnchor, constant: (view.frame.height / 35)).isActive = true
//        WoodstockLocationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
//        WoodstockLocationLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        WoodstockLocationLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 11)
//
//        KennesawLocationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        KennesawLocationLabel.topAnchor.constraint(equalTo: WoodstockLocationLabel.bottomAnchor, constant: (view.frame.height / 18)).isActive = true
//        KennesawLocationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
//        KennesawLocationLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        KennesawLocationLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 11)
//
//        RoswellLocationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        RoswellLocationLabel.topAnchor.constraint(equalTo: KennesawLocationLabel.bottomAnchor, constant: (view.frame.height / 18)).isActive = true
//        RoswellLocationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
//        RoswellLocationLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        RoswellLocationLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 11)
//    }
//
//    func setupLogoImageView() {
//        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//        logoImageView.bottomAnchor.constraint(equalTo: mottoLabel.topAnchor, constant: 15).isActive = true
//        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
//        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
//    }
//
//    func setupMottoLabel() {
//        mottoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        mottoLabel.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -1).isActive = true
//        mottoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
//        mottoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        mottoLabel.font = UIFont(name: "SavoyeLetPlain", size: view.frame.width / 11)
//    }
//
//    func setupInputsContainerView() {
//            inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//            inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//            inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
//            inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 100)
//            inputsContainerViewHeightAnchor?.isActive  = true
//
//            inputsContainerView.addSubview(emailTextField)
//            inputsContainerView.addSubview(emailSepartorView)
//            inputsContainerView.addSubview(passwordTextField)
//
//            // Constraints need x,y,width,height
//            emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
//            emailTextField.topAnchor.constraint(equalTo:  inputsContainerView.topAnchor).isActive = true
//            emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//            emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
//            emailTextFieldHeightAnchor?.isActive = true
//
//            // Constraints need x,y,width,height
//            emailSepartorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
//            emailSepartorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
//            emailSepartorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//            emailSepartorView.heightAnchor.constraint(equalToConstant: 1 ).isActive = true
//
//            // Constraints need x,y,width,height
//            passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
//            passwordTextField.topAnchor.constraint(equalTo:  emailTextField.bottomAnchor).isActive = true
//            passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//            passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
//            passwordTextFieldHeightAnchor?.isActive = true
//    }
    
//    func setupLoginRegisterButton() {
//        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor,  constant: 12).isActive = true
//        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor ).isActive = true
//        loginRegisterButton.heightAnchor.constraint(equalToConstant:  50).isActive = true
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        UIApplication.shared.statusBarStyle = .lightContent
//    }
//    override var preferredStatusBarStyle : UIStatusBarStyle {
//        return .lightContent
//    }
//
//}

//extension UIColor {
//
//    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
//        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
//    }

}


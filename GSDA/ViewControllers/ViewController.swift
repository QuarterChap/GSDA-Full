//
//  ViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 8/30/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase  

class ViewController: UIViewController {
    
    var db:Firestore!
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LoginBannerImg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let bannerImgBG: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let mottoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Just twelve weeks to a new career!"
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleLoginRegistration), for: .touchUpInside)
        
        return button
    }()
    
    lazy var resetPasswordButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Reset Password", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 166, g: 210, b: 253), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        
        return button
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailSepartorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var  loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: [ "Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(loginRegisterChange) , for: .valueChanged)
        return sc
    }()
    
    let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordSepartorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstNameSepartorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        // UIColor(r: 24, g: 108, b: 179)
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(logoImageView)
        view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(mottoLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(passwordSepartorView)
        view.addSubview(firstNameSepartorView)
        view.addSubview(resetPasswordButton)
        view.addSubview(bannerImgBG)
        view.addSubview(bannerImageView)
        
        setupInputsContainerView()
        setupLoginRegisterButton()
        setupLogoImageView()
        setupLoginRegisterSegmentedControl()
        setupMottoLabel()
        setupResetButton()
        setupImage()
        
        db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    var firstNameTextFieldHeightAnchor: NSLayoutConstraint?
    var lastNameTextFieldHeightAnchor: NSLayoutConstraint?
    
    @objc func loginRegisterChange() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)
        
        //change height of inputContainerView
        inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 100
        
        // change height of nameTextField
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        emailTextFieldHeightAnchor?.isActive = true
        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        passwordTextFieldHeightAnchor?.isActive = true
        
        firstNameTextFieldHeightAnchor?.isActive = false
        firstNameTextFieldHeightAnchor = firstNameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        firstNameTextFieldHeightAnchor?.isActive = true
        
        lastNameTextFieldHeightAnchor?.isActive = false
        lastNameTextFieldHeightAnchor = lastNameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        lastNameTextFieldHeightAnchor?.isActive = true
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            passwordSepartorView.alpha = 0
            firstNameTextField.alpha = 0
            firstNameSepartorView.alpha = 0
            lastNameTextField.alpha = 0
            
            inputsContainerViewHeightAnchor?.isActive  = false
            inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 100)
            inputsContainerViewHeightAnchor?.isActive  = true
        } else if loginRegisterSegmentedControl.selectedSegmentIndex == 1 {
            passwordSepartorView.alpha = 1
            firstNameTextField.alpha = 1
            firstNameSepartorView.alpha = 1
            lastNameTextField.alpha = 1
            
            inputsContainerViewHeightAnchor?.isActive  = false
            inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 200)
            inputsContainerViewHeightAnchor?.isActive  = true
        }
        
    }
    
    @objc func handleResetPassword() {
        self.present(ResetPasswordViewController(), animated: true) {}
    }
    
    @objc func handleLoginRegistration() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            if let email = emailTextField.text, let password = passwordTextField.text, ((emailTextField.text?.count)! > 0 && (passwordTextField.text?.count)! > 0) {
                
                AuthService.instance.login(email: email, password: password) { (error, data) in
                    guard error == nil else {
                        let alert = UIAlertController(title: "Error Authentication", message: error, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        return;
                    }
                    if error == nil {
                        print("Login Successful")
                        self.present(MainMenuViewController(), animated: true) {}
                    } else {
                        let alert = UIAlertController(title: "Username and Password Required", message: "You Must Enter a Username and Password", preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            // This is where I ended the login in part of this func!
        } else if loginRegisterSegmentedControl.selectedSegmentIndex == 1 {
            // register
            print("Register Button Pressed")
            
            if let email = emailTextField.text, let password = passwordTextField.text, let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, (email.count > 0 && password.count > 0) {
                AuthService.instance.SignUpUser(email: email, password: password, firstname: firstName, lastname: lastName, username: firstName + " " + lastName) { (error, data) in
                    if error != nil {
                        debugPrint(error!)
                    } else {
                        debugPrint("Success")
                        
                        // need to add in the first and last name some how
                        var ref: DocumentReference? = nil
                        ref = self.db.collection("Users").addDocument(data:[
                            "firstName":firstName,
                            "lastName":lastName,
                            "email":email]){err in
                                if let err = err{
                                    print("Error saving user details to database: \(err)")
                                }else{
                                    print("User details saved with ID: \(ref!.documentID)")
                                }
                        }
                        
                        
                        AuthService.instance.login(email: email, password: password) { (error, data) in
                            guard error == nil else {
                                let alert = UIAlertController(title: "Error Authentication", message: error, preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                                return;
                            }
                            if error == nil {
                                print("Login Successful")
                                let mmvc = MainMenuViewController() as UIViewController
                                self.navigationController?.pushViewController(mmvc, animated: true)
                            } else {
                                let alert = UIAlertController(title: "Username and Password Required", message: "You Must Enter a Username and Password", preferredStyle: .alert)
                                
                                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    func setupLoginRegisterSegmentedControl() {
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupLogoImageView() {
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width / 32).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width / 5).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
    }
    
    func setupMottoLabel() {
        mottoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mottoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10).isActive = true
        mottoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        mottoLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.055).isActive = true
        mottoLabel.font = UIFont(name: "SavoyeLetPlain", size: view.frame.width / 12)
    }
    
    func setupImage() {
        
        bannerImgBG.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 10).isActive = true
        bannerImgBG.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor, constant: 0).isActive = true
        bannerImgBG.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        bannerImgBG.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.145).isActive = true
        
        bannerImageView.centerXAnchor.constraint(equalTo: bannerImgBG.centerXAnchor).isActive = true
        bannerImageView.centerYAnchor.constraint(equalTo: bannerImgBG.centerYAnchor).isActive = true
        bannerImageView.widthAnchor.constraint(equalTo: bannerImgBG.widthAnchor, multiplier: 0.98).isActive = true
        bannerImageView.heightAnchor.constraint(equalTo: bannerImgBG.heightAnchor, multiplier: 0.95).isActive = true
        
    }
    
    func setupInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 65).isActive = true
            inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
            inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 100)
            inputsContainerViewHeightAnchor?.isActive  = true
            
            inputsContainerView.addSubview(emailTextField)
            inputsContainerView.addSubview(emailSepartorView)
            inputsContainerView.addSubview(passwordTextField)
            
            // Constraints need x,y,width,height
            emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            emailTextField.topAnchor.constraint(equalTo:  inputsContainerView.topAnchor).isActive = true
            emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
            emailTextFieldHeightAnchor?.isActive = true
            
            // Constraints need x,y,width,height
            emailSepartorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
            emailSepartorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
            emailSepartorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            emailSepartorView.heightAnchor.constraint(equalToConstant: 1 ).isActive = true
            
            // Constraints need x,y,width,height
            passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            passwordTextField.topAnchor.constraint(equalTo:  emailTextField.bottomAnchor).isActive = true
            passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
            passwordTextFieldHeightAnchor?.isActive = true
        
            passwordSepartorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
            passwordSepartorView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
            passwordSepartorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            passwordSepartorView.heightAnchor.constraint(equalToConstant: 1 ).isActive = true
            passwordSepartorView.alpha = 0
        
            firstNameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            firstNameTextField.topAnchor.constraint(equalTo:  passwordTextField.bottomAnchor).isActive = true
            firstNameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            firstNameTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
            firstNameTextFieldHeightAnchor?.isActive = true
            firstNameTextField.alpha = 0
        
            firstNameSepartorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
            firstNameSepartorView.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor).isActive = true
            firstNameSepartorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            firstNameSepartorView.heightAnchor.constraint(equalToConstant: 1 ).isActive = true
            firstNameSepartorView.alpha = 0
        
            lastNameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            lastNameTextField.topAnchor.constraint(equalTo:  firstNameTextField.bottomAnchor).isActive = true
            lastNameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            lastNameTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
            lastNameTextFieldHeightAnchor?.isActive = true
            lastNameTextField.alpha = 0
    }
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor,  constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor ).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
    }
    
    func setupResetButton() {
        resetPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resetPasswordButton.topAnchor.constraint(equalTo: loginRegisterButton.bottomAnchor,  constant: 12).isActive = true
        resetPasswordButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor ).isActive = true
        resetPasswordButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}


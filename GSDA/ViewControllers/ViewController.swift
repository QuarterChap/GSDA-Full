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
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    
    var signedIn = UserDefaults.standard.bool(forKey: "signedIn")
    
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
        
        label.text = "Georgia School of Dental Assisting" // Change this to the school name per Justin him self
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
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        textField.delegate = self
        
        return textField
    }()
    
    let emailSepartorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.delegate = self
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
    
    lazy var retypePasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Retype Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.delegate = self
        return textField
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        textField.delegate = self
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
        view.addSubview(retypePasswordTextField)
        view.addSubview(usernameTextField)
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
        
        handleTextField()
        
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //User alrdy autheticated
        if Api.User.CURRENT_USER != nil {
                self.present(MainMenuViewController(), animated: true, completion: nil)
        }
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
        firstNameTextFieldHeightAnchor = retypePasswordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        firstNameTextFieldHeightAnchor?.isActive = true
        
        lastNameTextFieldHeightAnchor?.isActive = false
        lastNameTextFieldHeightAnchor = usernameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        lastNameTextFieldHeightAnchor?.isActive = true
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            passwordSepartorView.alpha = 0
            retypePasswordTextField.alpha = 0
            firstNameSepartorView.alpha = 0
            usernameTextField.alpha = 0
            
            inputsContainerViewHeightAnchor?.isActive  = false
            inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 100)
            inputsContainerViewHeightAnchor?.isActive  = true
        } else if loginRegisterSegmentedControl.selectedSegmentIndex == 1 {
            passwordSepartorView.alpha = 1
            retypePasswordTextField.alpha = 1
            firstNameSepartorView.alpha = 1
            usernameTextField.alpha = 1
            
            inputsContainerViewHeightAnchor?.isActive  = false
            inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 200)
            inputsContainerViewHeightAnchor?.isActive  = true
        }
        
    }
    
    //Activates the register/login button if all the fields are filled if not then its not active
    func handleTextField() {
        usernameTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        emailTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        passwordTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
    }
    
    //Function that activates or deactivate the login/register button :)
    @objc func textFieldDidChange() {
<<<<<<< HEAD
        guard let username = usernameTextField.text, let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
=======
        guard let username = usernameTextField.text, !username.isEmpty, let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
>>>>>>> 124deeae3f78f18719def25381cbdec3178941fd
            
            loginRegisterButton.setTitleColor(UIColor.lightGray, for: .normal)
            loginRegisterButton.isEnabled = false
            return
        }
        loginRegisterButton.setTitleColor(UIColor.green, for: .normal)
        loginRegisterButton.isEnabled = true
    
    }
    
    @objc func handleResetPassword() {
        self.present(ResetPasswordViewController(), animated: true) {}
    }

    @objc func handleLoginRegistration() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            view.endEditing(true)
            // Login
            ProgressHUD.show("Please wait", interaction: false)
            AuthServ.signIn(email: emailTextField.text!, password: passwordTextField.text!, onSuccess: {
                ProgressHUD.showSuccess("Welcome")
                 self.present(MainMenuViewController(), animated: true, completion: nil)
            }) { (error) in
                ProgressHUD.showError(error!)
                print(error!)
            }
        } else if loginRegisterSegmentedControl.selectedSegmentIndex == 1 {
            view.endEditing(true)
            ProgressHUD.show("Welcome", interaction: false)
            AuthServ.signUp(username: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, onSuccess: {
                ProgressHUD.showSuccess("Welcome")
                self.present(MainMenuViewController(), animated: true, completion: nil)
            }) { (error) in
                ProgressHUD.showError(error!)
                print(error!)
            }
            
            if passwordTextField.text == retypePasswordTextField.text && passwordTextField.text!.count >= 6 {
                // if the email is already connected to an account send a notification
            } else if passwordTextField.text != retypePasswordTextField.text {
                // send a notification that they don't match
                print("Passwords dont match!!!")
                
                let alert = UIAlertController(title: "Passwords Don't Match", message: "Try Again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                        
                    case .cancel:
                        print("cancel")
                        
                    case .destructive:
                        print("destructive")
                        
                        
                    }}))
                self.present(alert, animated: true, completion: nil)
                
            } else if passwordTextField.text!.count <= 5 {
                print("Passwords must contain six or more characters!!!")
                
                let alert = UIAlertController(title: "The Password Must Be At Least 6 Characters", message: "Try Again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                        
                    case .cancel:
                        print("cancel")
                        
                    case .destructive:
                        print("destructive")
                        
                        
                    }}))
                self.present(alert, animated: true, completion: nil)
                
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
        mottoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: view.frame.height * 0.0375).isActive = true
        mottoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        mottoLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.055).isActive = true
        mottoLabel.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.05)
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
        
            retypePasswordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            retypePasswordTextField.topAnchor.constraint(equalTo:  passwordTextField.bottomAnchor).isActive = true
            retypePasswordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            firstNameTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
            firstNameTextFieldHeightAnchor?.isActive = true
            retypePasswordTextField.alpha = 0
        
            firstNameSepartorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
            firstNameSepartorView.topAnchor.constraint(equalTo: retypePasswordTextField.bottomAnchor).isActive = true
            firstNameSepartorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            firstNameSepartorView.heightAnchor.constraint(equalToConstant: 1 ).isActive = true
            firstNameSepartorView.alpha = 0
        
            usernameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            usernameTextField.topAnchor.constraint(equalTo:  retypePasswordTextField.bottomAnchor).isActive = true
            usernameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            lastNameTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
            lastNameTextFieldHeightAnchor?.isActive = true
            usernameTextField.alpha = 0
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
      
        if Api.User.CURRENT_USER != nil {
            self.navigationController?.pushViewController(MainMenuViewController(), animated: true)
        } else {
            //show message to login or register maybe?
        }
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}

extension UIColor {
    
    static let customBlue = UIColor(r: 166, g: 210, b: 253)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


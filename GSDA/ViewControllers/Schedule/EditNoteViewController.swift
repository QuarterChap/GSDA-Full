//
//  EditNoteViewController.swift
//  GSDA
//
//  Created by Joriah Lasater on 2/7/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

final class EditNoteViewController: UIViewController {
    
    var note: String?
    
    let textField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .gray
        textField.layer.cornerRadius = 20
        textField.clipsToBounds = true
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Done", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        return button
    }()

    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
        // Save data to Firebase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
        
        if let note = note {
            textField.text = note
        } else {
            textField.text = "Leave note here..."
        }
    }
    
    func setupSubViews() {
        view.addSubview(textField)
        view.addSubview(doneButton)
        view.addSubview(backButton)
        
        let padding: CGFloat = 20
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        textField.heightAnchor.constraint(equalToConstant: view.frame.width - (padding*2)).isActive = true 
        
        doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        backButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
    }
    
}

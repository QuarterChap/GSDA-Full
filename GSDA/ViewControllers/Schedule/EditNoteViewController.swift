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
    var date: Date!
    var uid: UUID?
    
    let textView: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.lightGray
        textField.textColor = .white 
        textField.layer.cornerRadius = 20
        textField.clipsToBounds = true
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = .myBlue
        button.setTitle("DONE", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    @objc func doneButtonPressed() {
        
        // this line of code determins if it is a new note or is being edited
        // Note UID = new note, old uid = edited note
        let noteUID = uid ?? UUID()
        
        NoteAPI().update(uid: noteUID, note: textView.text, for: date) {
            // Nothing unless we want to add some sort of animation for uploading
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
        
        if let note = note {
            textView.text = note
        } else {
            textView.text = "Leave note here..."
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func setupSubViews() {
        view.addSubview(textView)
        view.addSubview(doneButton)
        
        let padding: CGFloat = 20
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        textView.heightAnchor.constraint(equalToConstant: view.frame.width - (padding*2)).isActive = true 
        
        doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}

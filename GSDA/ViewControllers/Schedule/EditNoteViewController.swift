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
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.lightGray
        textView.textColor = .white 
        textView.layer.cornerRadius = 20
        textView.clipsToBounds = true
        textView.font = UIFont.systemFont(ofSize: 16)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTypingButtonPressed))
        let spacing = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spacing, doneButton, spacing], animated: false)
        textView.inputAccessoryView = toolbar
        return textView
    }()
    
    @objc func doneTypingButtonPressed() {
        textView.resignFirstResponder()
    }
    
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
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    var isAdmin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
        
        if let note = note {
            textView.text = note
        } else {
            textView.text = "Leave note here..."
        }
        textView.delegate = self
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        UserApi().isUserAdmin { (isAdmin) in
            self.isAdmin = isAdmin
            self.updateView()
        }
    }
    
    func updateView() {
        doneButton.isHidden = !isAdmin
        textView.isUserInteractionEnabled = isAdmin
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

extension EditNoteViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if note == nil {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        note = textView.text
    }
}

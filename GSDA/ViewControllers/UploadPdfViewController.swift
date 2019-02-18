//
//  UploadPdfViewController.swift
//  GSDA
//
//  Created by Work on 15/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
import MobileCoreServices
import FirebaseDatabase
import FirebaseStorage

class UploadPdfViewController: UIViewController {
    
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "title here.."
        textField.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        textField.textColor = .white
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    let descriptionTextField: UITextView = {
        let textField = UITextView()
        textField.textColor = .white
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        textField.text = "Description here.."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
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
    
    lazy var pickBtn: UIButton = {
        let pickBtn = UIButton()
        pickBtn.translatesAutoresizingMaskIntoConstraints = false
        pickBtn.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        pickBtn.layer.cornerRadius = 20
        pickBtn.clipsToBounds = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openDocPicker))
        pickBtn.addGestureRecognizer(gesture)
        pickBtn.isUserInteractionEnabled = true
        pickBtn.contentMode = .center
        return pickBtn
    }()
    
    var pdfUrl: URL?


    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        
    }
    
    @objc func doneButtonPressed() {
        uploadPdf()
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func openDocPicker() {
        handlePdf()
    }
    
    func handlePdf() {
     
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypePDF as String], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
    }
    
    func uploadPdf() {
        guard let pdfUrl = pdfUrl else {
            ProgressHUD.showError("Something went wrong")
            return
        }
        
        HelperService.uploadPdfToFirebase(pdfUrl: pdfUrl, title: titleTextField.text!, description: descriptionTextField.text!) {
            ProgressHUD.showSuccess("Succesfully uploaded")
            self.dismiss(animated: true, completion: nil)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupSubViews() {
        view.addSubview(titleTextField)
        self.view.addSubview(pickBtn)
        view.addSubview(descriptionTextField)
        view.addSubview(doneButton)
        view.addSubview(backButton)
        
        
        pickBtn.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 15).isActive = true
        pickBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        pickBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        pickBtn.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 15).isActive = true
        descriptionTextField.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor).isActive = true
        descriptionTextField.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor).isActive = true
        descriptionTextField.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
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

extension UploadPdfViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let selectedFileUrl = urls.first else {
            return
        }
        self.pdfUrl = selectedFileUrl
        //dismiss(animated: true, completion: nil)
        
    }
}

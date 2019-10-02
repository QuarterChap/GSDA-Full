//
//  PdfUploadViewController.swift
//  GSDA
//
//  Created by langsemJobb on 19/02/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
import MobileCoreServices

class PdfUploadViewController: UIViewController {
    
    lazy var selectedImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pdf"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .myBlue
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openpdfPicker))
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .center
        return imageView
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "title here.."
        textField.backgroundColor = .myBlue
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
        textField.backgroundColor = .myBlue
        textField.text = "Description here.."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        return textField
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = .myBlue
        button.setTitle("Done", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    //Variables
    var pdfUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setupSubViews()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupSubViews() {
        view.addSubview(titleTextField)
        view.addSubview(selectedImageView)
        view.addSubview(descriptionTextField)
        view.addSubview(doneButton)

        titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 15).isActive = true
        descriptionTextField.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor).isActive = true
        descriptionTextField.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor).isActive = true
        descriptionTextField.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        selectedImageView.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 15).isActive = true
        selectedImageView.leadingAnchor.constraint(equalTo: descriptionTextField.leadingAnchor).isActive = true
        selectedImageView.trailingAnchor.constraint(equalTo: descriptionTextField.trailingAnchor).isActive = true
        selectedImageView.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -15).isActive = true
        
        doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    @objc func doneButtonPressed() {
        uploadPdf()
    }
    
    func uploadPdf() {
        guard let pdfUrl = pdfUrl else {
            ProgressHUD.showError("Something went wrong")
            return
        }
        guard let data = try? Data.init(contentsOf: pdfUrl) else {
            return
        }
            HelperService.uploadPDFToFirebaseStorage(data: data, title: titleTextField.text ?? "", description: descriptionTextField.text) {
                // Do something maybe?
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func openpdfPicker() {
        handleSelectpdf()
    }
    
    func handleSelectpdf() {
        let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
    }
}
extension PdfUploadViewController:UIDocumentMenuDelegate,UIDocumentPickerDelegate,UINavigationControllerDelegate {
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        pdfUrl = url
        print("import result : \(url)")
    }
    
    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
}

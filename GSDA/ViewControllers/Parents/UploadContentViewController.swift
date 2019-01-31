//
//  UploadImageViewController.swift
//  GSDA
//
//  Created by Work on 25/01/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
import AVFoundation

class UploadContentViewController: UIViewController {
    
    lazy var selectedImageView: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
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
    
    //Variables
    var selectedImage: UIImage?
    var videoUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setupSubViews()
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
        descriptionTextField.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        selectedImageView.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 15).isActive = true
        selectedImageView.leadingAnchor.constraint(equalTo: descriptionTextField.leadingAnchor).isActive = true
        selectedImageView.trailingAnchor.constraint(equalTo: descriptionTextField.trailingAnchor).isActive = true
        selectedImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func doneButtonPressed() {
        //TODO: FOR NICK (Upload content)
        
        if let uploadImage = self.selectedImage, let imageData = UIImageJPEGRepresentation(uploadImage, 0.1) {
          let ratio = uploadImage.size.width / uploadImage.size.height
                HelperService.uploadDataToServer(data: imageData, videoUrl: videoUrl, ratio: ratio, title: titleTextField.text!, description: descriptionTextField.text!, onSuccess: {
                    self.clean()
                    self.present(PhotosViewController(), animated: true, completion: nil)
                })

      } else {
            //Show message to user that upload could not be made
            
       }
        
    }
    
    func clean() {
        self.titleTextField.text = ""
        self.descriptionTextField.text = ""
        self.selectedImageView.image = UIImage(named: "placeholder")
    }
    
    @objc func openGallery() {
        handleSelectPhoto()
    }
    
    func handleSelectPhoto() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        
        pickerController.mediaTypes = ["public.image", "public.movie"]
        present(pickerController, animated: true, completion: nil)
    }
    
}

extension UploadContentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
        print(info)
        
        if let videoUrl = info["UIImagePickerControllerMediaURL"] as? URL {
            // Selected Video
            if let thumbnailImage = thumbnailImageForFileUrl(videoUrl) {
                selectedImage = thumbnailImage
                selectedImageView.image = thumbnailImage
                self.videoUrl = videoUrl
            }
            dismiss(animated: true, completion: nil)
        }
        
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            // Selected Image
            selectedImage = image
            selectedImageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
    
    func thumbnailImageForFileUrl(_ fileUrl: URL) -> UIImage? {
        let asset = AVAsset(url: fileUrl)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        
        do {
            let thumbnailCGImage = try imageGenerator.copyCGImage(at: CMTimeMake(7, 1), actualTime: nil)
            return UIImage(cgImage: thumbnailCGImage)
        } catch let err {
            print(err)
        }
        
        return nil
    }
}

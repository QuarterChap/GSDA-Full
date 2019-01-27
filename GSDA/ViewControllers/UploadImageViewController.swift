//
//  UploadImageViewController.swift
//  GSDA
//
//  Created by Work on 25/01/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit
import AVFoundation

class UploadImageViewController: UIViewController {
    
    //Variables
    var photo = UIImageView?.self
    var selectedImage: UIImage?
    var videoUrl: URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        self.view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Upload")
        let backBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(backBtnPressed))
        navItem.leftBarButtonItem = backBtn
        
        navBar.setItems([navItem], animated: false);
        // Do any additional setup after loading the view.
    }
    
    @objc func backBtnPressed() {
    self.dismiss(animated: true, completion: nil)
    }
    
 /*   @objc func handleSelectPhoto() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        pickerController.mediaTypes = ["public.image", "public.movie"]
        present(pickerController, animated: true, completion: nil)
    }
    //Make the button go here {
       view.endEditing(true)

        if let uploadImage = self.selectedImage, let imageData = UIImageJPEGRepresentation(uploadImage, 0.1) {
            let ratio = uploadImage.size.width / profileImg.size.height
            HelperService.uploadDataToServer(data: imageData, videoUrl: self.videoUrl, ratio: ratio, caption: captionText.text!, onSuccess: {
                //Present feed or something after upload has been completed succesfully
            })
            
        } else {
            //Show message to user that upload could not be made
        }
    }

 */

}

/*
extension UploadImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
        print(info)
        
        if let videoUrl = info["UIImagePickerControllerMediaURL"] as? URL {
            if let thumnailImage = self.thumbnailImageForFileUrl(videoUrl) {
                selectedImage = thumnailImage
                photo.image = thumnailImage
                self.videoUrl = videoUrl
            }
            dismiss(animated: true, completion: nil)
        }
        
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = image
            photo.image = image
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
 
*/

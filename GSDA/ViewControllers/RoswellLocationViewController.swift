//
//  RoswellLocationViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/23/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import MapKit
import MessageUI

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle: String, pinSubtitle: String , location: CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubtitle
        self.coordinate = location
    }
}

class RoswellLocationViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    let roswellLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Roswell"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.white
        sv.alpha = 1
        sv.bounces = true
        sv.alwaysBounceVertical = true
        sv.alwaysBounceHorizontal = false
        sv.layer.zPosition = 0
        
        return sv
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        
        label.text = "☈ Take a virtual tour"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        
        label.text = "The Georgia School of Dental Assisting shares a space in the office of Dr. Igor Reizenson and Dr. Alla Alpert at iSmile Dental Group. There are eight dental treatment rooms equipped with dental chairs, units, and x-ray machines. There is a darkroom with an automated film processor. There is a sterilization room, a reception room, a break room, and a small dental laboratory. The facility has approximately 600 square feet available for student discussions. The school will occupy the total 2000 square foot of space."
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.zPosition = 1
        label.layer.cornerRadius = 15
        label.layer.masksToBounds  = true
        
        return label
    }()
    
    let videoView: UIWebView = {
        let view = UIWebView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds  = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    let mapView: MKMapView = {
        let view = MKMapView ()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.layer.masksToBounds  = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("(678) 689-5905", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleCall), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var emailButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("info@gadentalassisting.com", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var addressButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("11685 Alpharetta Highway, Suite 105, Roswell, Georgia 30076", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleLocation), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        button.layer.cornerRadius = 15
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel!.numberOfLines = 0
        
        return button
    }()
    
    let pin = customPin(pinTitle: "GSDA", pinSubtitle: "Roswell", location: CLLocationCoordinate2DMake(34.065013, -84.319645))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "RoswellLocationViewController"
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1050)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1200)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1300)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1415)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 1525)
        }
        
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        self.view.addSubview(backButton)
        
        backButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.925).isActive = true
    }
    
    func setupScrollView() {
        
        self.scrollView.addSubview(roswellLabel)
        self.scrollView.addSubview(label1)
        self.scrollView.addSubview(label2)
        self.scrollView.addSubview(videoView)
        self.scrollView.addSubview(callButton)
        self.scrollView.addSubview(emailButton)
        self.scrollView.addSubview(addressButton)
        self.scrollView.addSubview(mapView)
        
        roswellLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        roswellLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        roswellLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6).isActive = true
        roswellLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        roswellLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 8)
        
        label1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: roswellLabel.bottomAnchor, constant: 25).isActive = true
        label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        label1.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 14)
        
        label2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 15).isActive = true
        label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        label2.font = UIFont(name: "AmericanTypewriter", size: view.frame.width / 20)
        
        videoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        videoView.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15).isActive = true
        videoView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        videoView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.35).isActive = true
        getVideo(videoCode: "xOEJ7m6p2Dc")
        
        callButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        callButton.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 15).isActive = true
        callButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.65).isActive = true
        callButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        
        emailButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        emailButton.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 15).isActive = true
        emailButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        emailButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065).isActive = true
        emailButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.06)
        
        addressButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        addressButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 15).isActive = true
        addressButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        addressButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.115).isActive = true
        addressButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width / 21)
        addressButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: view.frame.width * 0.05)
        
        var centerLocation = CLLocationCoordinate2DMake(34.065013, -84.319645)
        var mapSpan = MKCoordinateSpanMake(0.01, 0.01 )
        var mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        
        mapView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: addressButton.bottomAnchor, constant: 15).isActive = true
        mapView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        mapView.setRegion(mapRegion, animated: true)
        
        mapView.addAnnotation(pin)
        
    }
    
    @objc func handleCall() {
        let url:NSURL = URL(string: "TEL://6786895905")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
    }
    
    @objc func handleEmail() {
        if MFMailComposeViewController.canSendMail(){
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["info@gadentalassisting.com"])
            present(mail, animated: true, completion: nil)
        }else{
            showMailError()
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleLocation () {
        let latitude:CLLocationDegrees = 34.065013
        let longitude:CLLocationDegrees = -84.319645
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates,regionDistance,regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey : NSValue(mkCoordinate:regionSpan.center), MKLaunchOptionsMapSpanKey : NSValue(mkCoordinateSpan:regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "GSDA Roswell"
        mapItem.openInMaps(launchOptions: options)
    }
    
    func configureMailController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        mailComposerVC.setToRecipients(["info@gadentalassisting.com"])
        
        return mailComposerVC
    }
    
    func showMailError(){
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Device couldn't send email.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController( controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func getVideo(videoCode: String ) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        videoView.loadRequest(URLRequest(url: url!))
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true, completion: {})
    }
    
}

//
//  ContactViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 9/3/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import MapKit

class ContactViewController: UIViewController {

    lazy var websiteButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Website", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(linkClicked(sender:)), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Call", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(makeAPhoneCall), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var addressButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("911 Sublime Trail, Canton GA, 30114", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(adressButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var emailButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("juliancearley@gmail.com", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(emailButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let mottoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Just twelve weeks to a new career!"
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        navigationItem.title = "ContactViewController"
        
        view.addSubview(websiteButton)
        view.addSubview(logoImageView)
        view.addSubview(mottoLabel)
        view.addSubview(callButton)
        view.addSubview(addressButton)
        view.addSubview(emailButton)
        
        setupWebsiteButton()
        setupLogoImageView()
        setupMottoLabel()
        setupCallButton()
        setupAddressButton()
        setupEmailButton()
    }
    
    func setupLogoImageView() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant:  150).isActive = true
    }
    
    func setupMottoLabel() {
        mottoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mottoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 2.5).isActive = true
        mottoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        mottoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupWebsiteButton() {
        websiteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        websiteButton.topAnchor.constraint(equalTo: mottoLabel.bottomAnchor, constant: 15).isActive = true
        websiteButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        websiteButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupCallButton() {
        callButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        callButton.topAnchor.constraint(equalTo: websiteButton.bottomAnchor, constant: 15).isActive = true
        callButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupAddressButton() {
        addressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addressButton.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 15).isActive = true
        addressButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        addressButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupEmailButton() {
        emailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailButton.topAnchor.constraint(equalTo: addressButton.bottomAnchor, constant: 15).isActive = true
        emailButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    @objc func linkClicked(sender: AnyObject) {
        openUrl(urlStr: "https://google.com")
    }
    
    func openUrl(urlStr:String!) {
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
    @objc func makeAPhoneCall()  {
        let url: NSURL = URL(string: "TEL://6785204065")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @objc func adressButtonAction() {
        let latitude: CLLocationDegrees = 34.294488
        let longitude: CLLocationDegrees = -84.454630
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placeMark)
        
        mapItem.name = "GSDA"
        mapItem.openInMaps(launchOptions: options)
    }
    
    @objc func emailButtonAction(_sender: Any) {
        UIApplication.shared.open(URL(string: "mailto:juliancearley@gmail.com") as! URL, options: [:], completionHandler: nil)
    }

}

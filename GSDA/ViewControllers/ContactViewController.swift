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
//        button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
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
//        button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
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
//        button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
        button.setTitle("Adress", for: .normal)
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
//        button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
        button.setTitle("Email", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(emailButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton(type:  .system)
//        button.backgroundColor = UIColor(r: 0, g: 100, b: 157)
        button.setTitle("Facebook", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(facbookButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds  = true
        
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type:  .system)
//        button.backgroundColor =  UIColor(r: 0, g: 100, b: 157)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
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
//        view.backgroundColor = UIColor(r: 145, g: 183, b: 219)
        navigationItem.title = "ContactViewController"
        
        view.addSubview(websiteButton)
        view.addSubview(logoImageView)
        view.addSubview(mottoLabel)
        view.addSubview(callButton)
        view.addSubview(addressButton)
        view.addSubview(emailButton)
        view.addSubview(backButton)
        view.addSubview(facebookButton)
        
        setupWebsiteButton()
        setupLogoImageView()
        setupMottoLabel()
        setupCallButton()
        setupAddressButton()
        setupEmailButton()
        setupBackButton()
        setupFacebookButton()
    }
    
    func setupLogoImageView() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
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
        websiteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupCallButton() {
        callButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        callButton.topAnchor.constraint(equalTo: websiteButton.bottomAnchor, constant: 25).isActive = true
        callButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupAddressButton() {
        addressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addressButton.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 25).isActive = true
        addressButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        addressButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupEmailButton() {
        emailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailButton.topAnchor.constraint(equalTo: addressButton.bottomAnchor, constant: 25).isActive = true
        emailButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupFacebookButton() {
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 25).isActive = true
        facebookButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupBackButton() {
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 75).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func linkClicked(sender: AnyObject) {
        openUrl(urlStr: "https://gadentalassisting.com")
    }
    
    @objc func facbookButtonTapped() {
        openUrl(urlStr: "https://www.facebook.com/GSDAroswellkennesaw/")
    }
 
    func openUrl(urlStr:String!) {
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        }
        
    }
    
    @objc func makeAPhoneCall()  {
        let url: NSURL = URL(string: "TEL://6786895905")! as NSURL
        UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
    }
    
    @objc func adressButtonAction() {
        let latitude: CLLocationDegrees = 34.065075
        let longitude: CLLocationDegrees = -84.319659
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let regionSpan = MKCoordinateRegion.init(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placeMark)
        
        mapItem.name = "GSDA"
        mapItem.openInMaps(launchOptions: options)
    }
    
    @objc func backButtonAction() {
        let mmvc = MainMenuViewController() as UIViewController
        self.navigationController?.pushViewController(mmvc, animated: true)
    }
    
    @objc func emailButtonAction(_sender: Any) {
        UIApplication.shared.open(URL(string: "mailto:juliancearley@gmail.com") as! URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
    }

}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}

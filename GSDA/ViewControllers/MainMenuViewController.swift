//
//  MainMenuViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 10/7/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    //julian
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    //chris
    let logoIV: UIImageView = {
        
        let logoImageV = UIImageView()
        
        logoImageV.image = UIImage(named: "GSDALogo")
        logoImageV.translatesAutoresizingMaskIntoConstraints = false
        logoImageV.contentMode = .scaleAspectFill
        
        return logoImageV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 145, g: 183, b: 219)
        navigationItem.title = "MainMenuViewController"
        
        view.addSubview(logoImageView)
        
        setupLogoImageView()
        
    }
    //julian
    func setupLogoImageView() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    
    //chris
    func setupLogoIV() {
        
        logoIV.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        logoIV.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
    }
    
}

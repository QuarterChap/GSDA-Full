//
//  MainMenuViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 10/7/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit
import Firebase

class MainMenuViewController: UIViewController {
    
    // buttons - Home, Contact, Locations, Schedule, Course Material, Assignments, Instructional Videos, photos
    // make a home button and the VC should look like the website home page with pictues/about and such
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 24, g: 108, b: 179)
        navigationItem.title = "MainMenuViewController"
        
        setupView()
    }
    
    func setupView() {
        
        self.view.addSubview(logo)
        //logo.
        
    }
    
}

//
//  HomeViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/10/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "HomeViewController"
        
    }

}

//
//  ProgramInfoViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/12/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class ProgramInfoViewController: UIViewController {

    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.clear
        sv.alpha = 1
        sv.layer.cornerRadius = 15
        sv.layer.masksToBounds  = true
        sv.bounces = true
        sv.alwaysBounceVertical = true
        sv.alwaysBounceHorizontal = false
        sv.layer.zPosition = 0
        
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "ProgramInfoViewController"
        
    }

}

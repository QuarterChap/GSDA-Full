//
//  AboutUsViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 12/11/18.
//  Copyright © 2018 Cearley-Programs. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
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
        navigationItem.title = "AboutUsViewController"
        
    }
    
    func setupView() {
        
    }
    
    func setupScrollView() {
        
    }

}

//
//  PPLE1ViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/28/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class GSDACatalogViewController: UIViewController {

    let webView: UIWebView = {
        let webView = UIWebView()
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scalesPageToFit = true
        
        return webView
    }()
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupView() {
        self.view.addSubview(webView)
        webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        let url = URL(string: self.url)
        let urlRequest = URLRequest(url: url!)
        self.webView.loadRequest(urlRequest)
    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
}

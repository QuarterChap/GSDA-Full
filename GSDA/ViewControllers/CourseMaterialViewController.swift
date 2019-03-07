//
//  CourseMaterialViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/28/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class CourseMaterialViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var gsdaCatalogButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("GSDA Catalog", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handleGSDACatalog), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    lazy var PPLE1Button: UIButton = {
        let button = UIButton(type:  .system)
        
        button.setTitle("PP LE1", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handlePPLE1), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.zPosition = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        navigationItem.title = "COURSE MATERIAL"
        
        setupScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupScrollView() {
        view.addSubview(tableView)
        
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true, completion: {})
    }
    
    @objc func handleGSDACatalog() {
        self.present(GSDACatalogViewController(), animated: true) {}
    }
    
    @objc func handlePPLE1() {
        self.present(GSDACatalogViewController(), animated: true) {}
    }
    
    var courseMaterialArray: [String] {
        get {
            var result = [String]()
            result.append("https://gadentalassisting.com/wp-content/uploads/2018/01/GSDACatalog2018.pdf")
            
            for i in 1...22 {
                if i == 21 {
                    continue
                }
                result.append("https://gadentalassisting.com/wp-content/uploads/2016/05/PP-LE\(i).pdf")
            }
            return result
        }
    }
}


extension CourseMaterialViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let courseMaterialURL = courseMaterialArray[row]
        let vc = GSDACatalogViewController()
        vc.url = courseMaterialURL
        present(vc, animated: true, completion: nil)
    }
}

extension CourseMaterialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseMaterialArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(row + 1)"
        // gsdaCatalogButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        //        gsdaCatalogButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.frame.height * 0.075).isActive = true
        //        gsdaCatalogButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        //        gsdaCatalogButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        //        gsdaCatalogButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        //
        //        PPLE1Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        //        PPLE1Button.topAnchor.constraint(equalTo: gsdaCatalogButton.bottomAnchor, constant: view.frame.height * 0.025).isActive = true
        //        PPLE1Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        //        PPLE1Button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        //        PPLE1Button.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: view.frame.width * 0.04)
        
        return cell
    }
}

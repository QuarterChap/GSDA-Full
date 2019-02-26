//
//  CourseMaterialViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/28/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class CourseMaterialViewController: UIViewController {
    
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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Course Material"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor(r: 166, g: 210, b: 253)
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
        navigationItem.title = "CourseMaterialViewController"
        
        
        setupView()
        setupScrollView()
    }
    
    func setupView() {
        self.view.addSubview(backButton)
        
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
    }
    
    func setupScrollView() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
        
        titleLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: view.frame.width / 10)
        
        
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -10).isActive = true
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true, completion: {})
    }
    
    @objc func handleGSDACatalog() {
        self.present(GSDACatalogViewController(), animated: true) {}
    }
    
    @objc func handlePPLE1() {
        self.present(PPLE1ViewController(), animated: true) {}
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
        let vc = PPLE1ViewController()
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

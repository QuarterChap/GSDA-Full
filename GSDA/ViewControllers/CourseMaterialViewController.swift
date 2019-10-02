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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
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
        self.present(WKWebViewController(), animated: true) {}
    }
    
    @objc func handlePPLE1() {
        self.present(WKWebViewController(), animated: true) {}
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
        let vc = WKWebViewController()
        vc.url = courseMaterialURL
        let cell = tableView.cellForRow(at: indexPath)
        vc.title = cell?.textLabel?.text
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CourseMaterialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseMaterialArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = UITableViewCell()
        if row == 0 {
            cell.textLabel?.text = "CATALOG"
        } else {
            if row == 21 {
                cell.textLabel?.text = "PPLE \(row + 1)"
            } else {
                cell.textLabel?.text = "PPLE \(row)"
            }
        }
        
        return cell
    }
}

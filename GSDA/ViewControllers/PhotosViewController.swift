//
//  PhotosViewController.swift
//  GSDA
//
//  Created by Julian Cearley on 1/10/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

class PhotosViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var previousVC = UserDefaults.standard.string(forKey: "previousVC")
    
    lazy var mainMenuButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Main Menu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleMainMenu), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        
        return button
    }()
    
    let cellID = "PhotosCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView?.backgroundColor = UIColor.white
        collectionView?.layer.zPosition = 0
        navigationItem.title = "PhotosViewController"
        collectionView?.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        setupView()
        setupCollectionView()
    }
    
    func setupView() {
        self.view.addSubview(mainMenuButton)
        
        mainMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainMenuButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mainMenuButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
    }
    
    func setupCollectionView() {
        
    }
    
    @objc func handleMainMenu() {
        previousVC = ""
        UserDefaults.standard.set("", forKey: "previousVC")
        UserDefaults.standard.synchronize()
        self.present(MainMenuViewController(), animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return customCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
}

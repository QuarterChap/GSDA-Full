//
//  NoteListViewController.swift
//  GSDA
//
//  Created by Joriah Lasater on 2/7/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

final class NoteListViewController: UIViewController {
    
    // Must add before init
    var date: Date!
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "January"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var notesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = UIColor(r: 166, g: 210, b: 253)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.zPosition = 1
        return button
    }()
    
//    var notes = [String]()
    var notes = ["Wow this is my awesome note", "Nah dawg this note is much netter@!", "Okay guys"]
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        dateLabel.text = date.asString(style: DateFormatter.Style.medium)
    }
    
    func getNotes() {
        
    }
    
    func setupSubViews() {
        view.addSubview(dateLabel)
        view.addSubview(notesTableView)
        view.addSubview(backButton)

        dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        notesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        notesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        notesTableView.bottomAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        notesTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true

        backButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.075).isActive = true
    }
}


extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let note = notes[indexPath.row]
        // present Note Editor ViewController
        let vc = EditNoteViewController()
        vc.note = note
        present(vc, animated: true, completion: nil)
    }
}

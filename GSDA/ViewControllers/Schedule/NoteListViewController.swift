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
    var date: Date! {
        didSet {
            fetchNotes()
        }
    }
    
    lazy var notesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type:  .system)
        button.backgroundColor = .myBlue
        button.setTitle("NEW", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    var notes = [NoteModel]()
    
    @objc func addButtonPressed() {
        // Create new note
        let vc = EditNoteViewController()
        vc.date = date
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        title = date.asString(style: DateFormatter.Style.medium)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchNotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func fetchNotes() {
        notes.removeAll()
        // Fetch notes for day from firebase and set to var notes
        NoteAPI().fetchNotes(for: date) { [weak self] (note) in
            self?.notes.append(note)
            self?.notesTableView.reloadData()
        }
    }
    
    func setupSubViews() {
        view.addSubview(notesTableView)
        view.addSubview(addButton)
        
        notesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        notesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        notesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        notesTableView.bottomAnchor.constraint(equalTo: addButton.topAnchor).isActive = true
        
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = notes[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let note = notes[indexPath.row]

        // present Note Editor ViewController
        let vc = EditNoteViewController()
        vc.date = date
        vc.note = note.text
        vc.uid = UUID(uuidString: note.uid)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            
            let note = notes.remove(at: indexPath.row)
            tableView.reloadData()
            guard let uid = UUID(uuidString: note.uid) else {
                return
            }
            NoteAPI().deleteNote(with: date, with: uid) {
                // Deleted
                
            }
            
        }
    }
}

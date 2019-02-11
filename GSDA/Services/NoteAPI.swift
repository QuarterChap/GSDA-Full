//
//  NoteAPI.swift
//  GSDA
//
//  Created by Joriah Lasater on 2/10/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseDatabase
class NoteAPI {
    
    var REF_NOTES = Database.database().reference().child("notes")
    
    func update(uid: UUID, note: String, for date: Date, completion: @escaping ()->()) {
        let timestamp = String(Int(date.timeIntervalSince1970))
        
        REF_NOTES.child(timestamp).child(uid.uuidString).setValue(note) { (error, _) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.addToNoteList(timestamp: timestamp)
            completion()
        }
    }
    
    func fetchNotes(for date: Date, completion: @escaping (NoteModel)->()) {
        let timestamp = String(Int(date.timeIntervalSince1970))
        
        REF_NOTES.child(timestamp).observeSingleEvent(of: .value) { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any]{
                for uidKey in dict.keys {
                    if let text = dict[uidKey] as? String {
                        let note = NoteModel(uid: uidKey, text: text)
                        completion(note)
                    }
                }
            }
        }
    }
    
    func deleteNote(with date: Date, with uid: UUID, completion: @escaping ()->()) {
        let timestamp = String(Int(date.timeIntervalSince1970))
        
        REF_NOTES.child(timestamp).child(uid.uuidString).removeValue { (error, _) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.remove(timestamp: timestamp)
            completion()
        }
    }
    
    func fetchNoteList(completion: @escaping ([String]) -> ()) {
        REF_NOTES.child("has_note_list").observeSingleEvent(of: .value) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                completion(Array(dict.keys))
            }
        }
    }
    
    private func remove(timestamp: String) {
        // Check to see if there are any other notes first if empty then remove
        REF_NOTES.child(timestamp).observeSingleEvent(of: .value) { (snapshot) in
            if let _ = snapshot.value as? [String: Any] {
                // Does have notes
                return
            } else {
                // Doesn't have notes
                self.REF_NOTES.child("has_note_list").child(timestamp).removeValue()
            }
        }
    }
    
    private func addToNoteList(timestamp: String) {
        REF_NOTES.child("has_note_list").child(timestamp).setValue(true)
    }
}

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
    var REF_POSTS = Database.database().reference().child("notes")

    func update(uid: UUID, note: String, for date: Date, completion: @escaping ()->()) {
        let timestamp = String(Int(date.timeIntervalSince1970))
        
        REF_POSTS.child(timestamp).child(uid.uuidString).setValue(note) { (error, _) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            completion()
        }
    }
    
    func fetchNotes(for date: Date, completion: @escaping (NoteModel)->()) {
        let timestamp = String(Int(date.timeIntervalSince1970))
        
        REF_POSTS.child(timestamp).observeSingleEvent(of: .value) { (snapshot) in
            
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
}

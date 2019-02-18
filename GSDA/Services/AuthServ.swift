//
//  AuthServ.swift
//  GSDA
//
//  Created by Work on 27/01/2019.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class AuthServ{
    
    static func signIn(email:String, password: String, onSuccess: @escaping () -> Void, onError: @escaping(_ errorMessage: String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                onError(error?.localizedDescription)
                return
            }
            onSuccess()
        }
    }
    
    static func signUp(username: String, email:String, password: String, onSuccess: @escaping () -> Void, onError: @escaping(_ errorMessage: String?) -> Void) {
        //Create new user
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                onError(error?.localizedDescription)
                return
            }
            let uid = user?.user.uid
            self.setUserInformation(username: username, email: email, uid: uid!, onSuccess: onSuccess)
        }
    }
 
    //Stores user in database
   static func setUserInformation(username: String, email: String, uid: String, onSuccess: @escaping () -> Void) {
        let ref = Database.database().reference()
        let usersReference = ref.child("users")
        let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["username": username, "email": email])
    onSuccess()
    }
    
    
    //Update the user with email if needed
    static func updateUserInfor(username: String, email: String, onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        
        Api.User.CURRENT_USER?.updateEmail(to: email, completion: { (error) in
            if error != nil {
                onError(error!.localizedDescription)
            }else {
                let uid = Api.User.CURRENT_USER?.uid
                            self.updateDatabase(username: username, email: email, onSuccess: onSuccess, onError: onError)
                        }

                    })
            }
    
    //Updates the database information
    static func updateDatabase(username: String, email: String, onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        let dict = ["username": username, "username_lowercase": username.lowercased(), "email": email]
        Api.User.REF_CURRENT_USER?.updateChildValues(dict, withCompletionBlock: { (error, ref) in
            if error != nil {
                onError(error!.localizedDescription)
            } else {
                onSuccess()
            }
            
        })
    }
    
    
    //Function for logout the user
    static func logout(onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        do {
            try Auth.auth().signOut()
            onSuccess()
            
        } catch let logoutError {
            onError(logoutError.localizedDescription)
        }
    }
}

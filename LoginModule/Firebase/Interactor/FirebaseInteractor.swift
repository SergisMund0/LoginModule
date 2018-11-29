//
//  FirebaseInteractor.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation
import Firebase

final class FirebaseInteractor {
    static let shared = FirebaseInteractor()
    private let firebaseReference: DatabaseReference!
    
    private init() {
        FirebaseApp.configure()
        firebaseReference = Database.database().reference()
    }
}

extension FirebaseInteractor: FirebaseInteractorInjection {
    func createUser(userModel: UserModel) {
        Auth.auth().createUser(withEmail: userModel.email, password: userModel.password) { (authResult, error) in
            //guard let user = authResult?.user else { return }
        }
    }
    
    func signIn(userModel: UserModel) {
        Auth.auth().signIn(withEmail: userModel.email, password: userModel.password) { user, error in
            
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

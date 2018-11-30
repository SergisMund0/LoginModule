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
    // Public properties
    static let shared = FirebaseInteractor()
    var routerDelegate: FirebaseRouterDelegate?
    
    // Private properties
    private let firebaseReference: DatabaseReference!
    
    private init() {
        FirebaseApp.configure()
        firebaseReference = Database.database().reference()
    }
}

extension FirebaseInteractor: FirebaseInteractorInjection {
    func createUser(userModel: UserModel) {
        Auth.auth().createUser(withEmail: userModel.email, password: userModel.password) { (authResult, error) in
            if let error = error as NSError? {
                self.processFirebaseErrorCode(error)
            }
            
            guard let user = authResult?.user else { return }
        }
    }
    
    func signIn(userModel: UserModel) {
        Auth.auth().signIn(withEmail: userModel.email, password: userModel.password) { user, error in
            if let error = error as NSError? {
                self.processFirebaseErrorCode(error)
            }
            
            
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            self.processFirebaseErrorCode(error)
        }
    }
    
    func processFirebaseErrorCode(_ error: NSError) {
        let errorViewModel = ErrorViewModel(titleString: error.localizedDescription)
        routerDelegate?.sceneDidFinish(error: errorViewModel)
    }
}

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
    // MARK: - Public properties
    static let shared = FirebaseInteractor()
    var routerDelegate: FirebaseRouterDelegate?
    
    // MARK: - Private properties
    private let firebaseReference: DatabaseReference!
    
    private init() {
        FirebaseApp.configure()
        firebaseReference = Database.database().reference()
    }
}

// MARK: - FirebaseInteractorInjection
extension FirebaseInteractor: FirebaseInteractorInjection {
    func createUser(userModel: UserModel) {
        Auth.auth().createUser(withEmail: userModel.email, password: userModel.password) { (authResult, error) in
            if let error = error as NSError? {
                self.processFirebaseErrorCode(error)
            }
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
        let errorViewModel = ErrorViewInjectionModel(subtitle: error.localizedDescription)
        routerDelegate?.sceneDidFinish(error: errorViewModel)
    }
}

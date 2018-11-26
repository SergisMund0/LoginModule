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
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else { return }
        }
    }
}

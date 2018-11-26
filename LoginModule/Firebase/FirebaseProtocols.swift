//
//  FirebaseProtocols.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

protocol FirebaseInteractorInjection {
    func createUser(email: String, password: String)
    func signIn(email: String, password: String)
    func signOut()
}

protocol FirebaseInteractorDelegate {
    
}

protocol FirebaseRouterInjection {
    static func setup() -> FirebaseInteractorInjection
}

protocol FirebaseRouterDelegate {
    
}

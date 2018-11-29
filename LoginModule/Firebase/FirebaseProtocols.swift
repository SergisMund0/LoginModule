//
//  FirebaseProtocols.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

protocol FirebaseInteractorInjection {
    func createUser(userModel: UserModel)
    func signIn(userModel: UserModel)
    func signOut()
}

protocol FirebaseInteractorDelegate {
    
}

protocol FirebaseRouterInjection {
    static func setup() -> FirebaseInteractorInjection
}

protocol FirebaseRouterDelegate {
    
}

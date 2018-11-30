//
//  LoginPresenter.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class LoginPresenter {
    // Public properties
    var interactor: LoginInteractorInjection?
    
    // Private properties
    private var firebaseInteractor = FirebaseRouter.setup()
}

extension LoginPresenter: LoginViewDelegate {
    func viewDidSendUpdates(loginViewModel: LoginViewModel) {
        guard let leadingString = loginViewModel.leadingString else {
            // Empty state logic
            
            return
        }
        
        guard let trailingString = loginViewModel.trailingString else {
            // Empty state logic
            
            return
        }
        
        firebaseInteractor.routerDelegate = self
        let userModel = UserModel(email: leadingString, password: trailingString)
        firebaseInteractor.createUser(userModel: userModel)
    }
}

extension LoginPresenter: FirebaseRouterDelegate {
    func sceneDidFinish(error: ErrorViewModel) {
        print("I'm here!")
    }
}

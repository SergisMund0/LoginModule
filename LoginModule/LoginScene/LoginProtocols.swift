//
//  LoginProtocols.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

protocol LoginViewInjection {
    var presenter: LoginViewDelegate? { get set }
    
    func viewDidReceiveUpdates(loginViewInjectionModel: LoginViewInjectionModel)
}

protocol LoginViewDelegate {
    func viewDidSendUpdates(_ loginViewDelegateModel: LoginViewDelegateModel)
}

protocol LoginPresenterInjection {
    var view: LoginViewInjection? { get set }
    var interactor: LoginInteractorInjection? { get set }
}

protocol LoginPresenterDelegate {
    
}

protocol LoginInteractorInjection {
    // Firebase handles the badly formatted information introduced by the user. This functions just adds
    // an additional layer in order to check the requirements before the call
    func validate(email: String?, password: String?) -> (isEmailValid: RequirementState, isPasswordValid: RequirementState) 
}

protocol LoginRouterInjection {
    static func setup(loginViewInjectionModel: LoginViewInjectionModel) -> LoginViewInjection?
}

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
    func viewDidReceiveUpdates(loginViewModel: LoginViewModel)
}

protocol LoginViewDelegate {
    func viewDidSendUpdates(loginViewModel: LoginViewModel)
}

protocol LoginPresenterInjection {
    var view: LoginViewInjection? { get set }
    var interactor: LoginInteractorInjection? { get set }
}

protocol LoginPresenterDelegate {
    
}

protocol LoginInteractorInjection {
    
}

protocol LoginInteractorDelegate {
    
}

protocol LoginRouterInjection {
    static func setup() -> LoginViewInjection?
}

protocol LoginRouterDelegate {
    
}

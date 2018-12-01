//
//  LoginRouter.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class LoginRouter {
    
}

extension LoginRouter: LoginRouterInjection {
    static func setup(loginViewInjectionModel: LoginViewInjectionModel = LoginViewInjectionModel()) -> LoginViewInjection? {
        var loginViewInjection = Bundle.main.loadNibNamed(LoginViewController.nibName, owner: nil, options: nil)?[0] as? LoginViewInjection
        var presenter: LoginPresenterInjection & LoginViewDelegate = LoginPresenter()
        let loginInteractor: LoginInteractorInjection = LoginInteractor()
        
        loginViewInjection?.presenter = presenter
        presenter.view = loginViewInjection
        presenter.interactor = loginInteractor
        loginViewInjection?.viewDidReceiveUpdates(loginViewInjectionModel: loginViewInjectionModel)
        
        return loginViewInjection
    }
}

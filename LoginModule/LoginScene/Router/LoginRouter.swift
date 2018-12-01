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
    static func setup() -> LoginViewInjection? {
        var loginViewInjection = Bundle.main.loadNibNamed(LoginViewController.nibName, owner: nil, options: nil)?[0] as? LoginViewInjection
        var presenter: LoginPresenterInjection & LoginViewDelegate = LoginPresenter()
        loginViewInjection?.presenter = presenter
        presenter.view = loginViewInjection
        
        return loginViewInjection
    }
}

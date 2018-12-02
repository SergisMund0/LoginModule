//
//  ErrorRouter.swift
//  LoginModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class ErrorRouter: ErrorRouterInjection {
    static func setup(errorViewModel: ErrorViewInjectionModel) -> ErrorViewInjection? {
        var errorViewInjection = Bundle.main.loadNibNamed(ErrorViewController.nibName, owner: nil, options: nil)?[0] as? ErrorViewInjection
        var presenter: ErrorPresenterInjection & ErrorViewDelegate = ErrorPresenter()
        presenter.view = errorViewInjection
        errorViewInjection?.presenter = presenter
        
        errorViewInjection?.viewDidReceiveUpdates(errorViewModel: errorViewModel)
        
        return errorViewInjection
    }
}

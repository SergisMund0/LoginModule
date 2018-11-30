//
//  ErrorRouter.swift
//  LoginModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class ErrorRouter {
    
}

extension ErrorRouter: ErrorRouterInjection {
    static func setup(errorViewModel: ErrorViewModel) -> ErrorViewInjection? {
        var errorViewInjection = Bundle.main.loadNibNamed(ErrorViewController.nibName, owner: nil, options: nil)?[0] as? ErrorViewInjection
        errorViewInjection?.viewDidReceiveUpdates(errorViewModel: errorViewModel)
        
        return errorViewInjection
    }
}

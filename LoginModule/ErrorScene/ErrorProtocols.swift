//
//  ErrorProtocols.swift
//  ErrorModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

protocol ErrorViewInjection {
    var presenter: ErrorViewDelegate? { get set }
    
    func viewDidReceiveUpdates(errorViewModel: ErrorViewInjectionModel)
}

protocol ErrorViewDelegate {
    func bottomButtonDidPress()
}

protocol ErrorPresenterInjection {
    var view: ErrorViewInjection? { get set }
}

protocol ErrorRouterInjection {
    static func setup(errorViewModel: ErrorViewInjectionModel) -> ErrorViewInjection?
}

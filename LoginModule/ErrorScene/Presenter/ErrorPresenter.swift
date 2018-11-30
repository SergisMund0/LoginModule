//
//  ErrorPresenter.swift
//  LoginModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class ErrorPresenter {
    var interactor: ErrorInteractorInjection?
}

extension ErrorPresenter: ErrorPresenterInjection {
}

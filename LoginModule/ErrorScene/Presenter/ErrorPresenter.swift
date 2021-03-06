//
//  ErrorPresenter.swift
//  LoginModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class ErrorPresenter: ErrorPresenterInjection {
    // MARK: - Public properties
    var view: ErrorViewInjection?
}

// MARK: - ErrorViewDelegate
extension ErrorPresenter: ErrorViewDelegate {
    func bottomButtonDidPress() {
        guard let errorViewController = view as? ErrorViewController else { return }
        
        errorViewController.dismiss(animated: true, completion: nil)
    }
}

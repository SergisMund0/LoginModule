//
//  ErrorView.swift
//  LoginModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import UIKit

final class ErrorViewController: UIViewController {
    // MARK: - Public properties
    var presenter: ErrorViewDelegate?
    
    // MARK: - Private properties
    static let nibName = "ErrorViewController"
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var bottomButton: UIButton!
    
    // MARK: - Actions
    @IBAction func bottomButtonDidPress(_ sender: Any) {
        let errorViewModel = ErrorViewModel(titleString: "")
        presenter?.viewDidSendUpdates(errorViewModel: errorViewModel)
    }
}

// MARK: - ErrorViewInjection
extension ErrorViewController: ErrorViewInjection {
    func viewDidReceiveUpdates(errorViewModel: ErrorViewModel) {
        titleLabel.text = errorViewModel.titleString
        bottomButton.titleLabel?.text = errorViewModel.bottomButtonString 
    }
}

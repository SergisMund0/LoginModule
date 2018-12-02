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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak private var bottomButton: UIButton!
    
    // MARK: - Actions
    @IBAction func bottomButtonDidPress(_ sender: Any) {
        presenter?.bottomButtonDidPress()
    }
}

// MARK: - ErrorViewInjection
extension ErrorViewController: ErrorViewInjection {
    func viewDidReceiveUpdates(errorViewModel: ErrorViewInjectionModel) {
        titleLabel.text = errorViewModel.title
        subtitleLabel.text = errorViewModel.subtitle
        bottomButton.setTitle(errorViewModel.bottomButtonTitle, for: .normal)
    }
}

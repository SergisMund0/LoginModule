//
//  LoginView.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    // Public properties
    var presenter: LoginViewDelegate?
    
    // Private properties
    static let nibName = "LoginViewController"
    private(set) var loginViewModel: LoginViewModel?
    
    @IBOutlet weak private var leadingTextField: UITextField!
    @IBOutlet weak private var trailingTextField: UITextField!
    @IBOutlet weak private var bottomLabel: UILabel!
    
    // UIViewController setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviewActions()
    }
    
    private func setupSubviewActions() {
        bottomLabel.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bottomLabelDidPress))
        bottomLabel.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Actions
    @objc func bottomLabelDidPress() {
        presenter?.viewDidSendUpdates(loginViewModel: loginViewModel)
    }
}

extension LoginViewController: LoginViewInjection {
    func viewDidReceiveUpdates(loginViewModel: LoginViewModel) {
        leadingTextField.text = loginViewModel.leadingString
        trailingTextField.text = loginViewModel.trailingString
        bottomLabel.text = loginViewModel.bottomString
    }
}

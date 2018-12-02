//
//  LoginView.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: - Public properties
    var presenter: LoginViewDelegate?
    
    // MARK: - Private properties
    static let nibName = "LoginViewController"
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var leadingTextField: UITextField!
    @IBOutlet weak private var trailingTextField: UITextField!
    @IBOutlet weak private var actionButton: UIButton!
    @IBOutlet weak private var bottomLabel: UILabel!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviewActions()
    }
    
    private func setupSubviewActions() {
        bottomLabel.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bottomLabelDidPress))
        bottomLabel.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - Actions
    @IBAction func actionButtonDidPress(_ sender: Any) {
        guard let loginViewDelegateModel = LoginViewDelegateModel(leadingText: leadingTextField.text, trailingText: trailingTextField.text, actionButtonTitle: actionButton.titleLabel?.text) else { return }
        
        presenter?.viewDidSendUpdates(loginViewDelegateModel)
    }
    
    @objc func bottomLabelDidPress() {
        guard let loginViewDelegateModel = LoginViewDelegateModel(leadingText: leadingTextField.text, trailingText: trailingTextField.text, actionButtonTitle: actionButton.titleLabel?.text) else { return }
        
        presenter?.viewDidChangeState(loginViewDelegateModel)
    }
}

// MARK: - LoginViewInjection
extension LoginViewController: LoginViewInjection {
    func viewDidReceiveUpdates(loginViewInjectionModel: LoginViewInjectionModel) {
        titleLabel.text = loginViewInjectionModel.title
        leadingTextField.placeholder = loginViewInjectionModel.leadingPlaceholder
        trailingTextField.placeholder = loginViewInjectionModel.trailingPlaceholder
        actionButton.setTitle(loginViewInjectionModel.actionButtonTitle, for: .normal)
        bottomLabel.text = loginViewInjectionModel.bottomTitle
    }
}

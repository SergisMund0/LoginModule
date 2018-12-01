//
//  LoginPresenter.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class LoginPresenter: LoginPresenterInjection {
    // MARK: - Public properties
    var view: LoginViewInjection?
    var interactor: LoginInteractorInjection?
    
    // MARK: - Private properties
    private var firebaseInteractor = FirebaseRouter.setup()
    
    init() {
        firebaseInteractor.routerDelegate = self
    }
}


// MARK: - LoginViewDelegate
extension LoginPresenter: LoginViewDelegate {
    func viewDidSendUpdates(_ loginViewDelegateModel: LoginViewDelegateModel) {
        // Validate if the information filled by the user accomplish the minimum rules for a registration
        if !validate(email: loginViewDelegateModel.leadingText, password: loginViewDelegateModel.trailingText) {
            // If the information is not valid, the flow breaks and the Error Scene it's presented
            return
        }
        
        switch loginViewDelegateModel.bottomState {
        case .createUser:
            createUser(email: loginViewDelegateModel.leadingText, password: loginViewDelegateModel.trailingText)
        case .signIn:
            signIn(email: loginViewDelegateModel.leadingText, password: loginViewDelegateModel.trailingText)
        case .signOut:
            signOut()
        }
    }
}

// MARK: - FirebaseRouterDelegate
extension LoginPresenter: FirebaseRouterDelegate {
    // If the first local validation success but there is a problem with the network call,
    // the Error Scene will be invoked with the information returned from the server
    func sceneDidFinish(error: ErrorViewModel) {
        presentErrorScene(errorDescription: error.titleString)
    }
}

// MARK: - Helpers
extension LoginPresenter {
    private func validate(email: String?, password: String?) -> Bool {
        guard let interactor = interactor else { return false }
        
        let validation = interactor.validate(email: email, password: password)
        let errorDescription = getErrorDescription(emailState: validation.isEmailValid, passwordState: validation.isPasswordValid)
        
        // Invoke error scene if necessary
        if let errorDescription = errorDescription {
            presentErrorScene(errorDescription: errorDescription)
        }

        return validation.isEmailValid == .valid && validation.isPasswordValid == .valid
    }
    
    private func getErrorDescription(emailState: RequirementState, passwordState: RequirementState) -> String? {
        var errorDescription: String?

        if emailState == .empty {
            errorDescription = LoginResources.emailEmpty
        }
        
        if passwordState == .empty {
            errorDescription = LoginResources.passwordEmpty
        }
        
        if emailState == .empty && passwordState == .empty {
            errorDescription = LoginResources.emailAndPasswordEmpty
        }
        
        if emailState == .invalid {
            errorDescription = LoginResources.emailNotValid
        }
        
        if passwordState == .invalid {
            errorDescription = LoginResources.passwordNotValid
        }
        
        if emailState == .invalid && passwordState == .invalid {
            errorDescription = LoginResources.emailAndPasswordNotValid
        }
        
        return errorDescription
    }
    
    private func createUser(email: String?, password: String?) {
        if let email = email, let password = password {
            let userModel = UserModel(email: email, password: password)
            firebaseInteractor.createUser(userModel: userModel)
        }
    }
    
    private func signIn(email: String?, password: String?) {
        if let email = email, let password = password {
            let userModel = UserModel(email: email, password: password)
            firebaseInteractor.signIn(userModel: userModel)
        }
    }
    
    private func signOut() {
        firebaseInteractor.signOut()
    }
    
    private func presentErrorScene(errorDescription: String) {
        let errorViewModel = ErrorViewModel(titleString: errorDescription)
        
        guard let errorViewController = (ErrorRouter.setup(errorViewModel: errorViewModel) as? ErrorViewController),
            let loginViewController = view as? LoginViewController else { return }
        
        loginViewController.present(errorViewController, animated: true, completion: nil)
    }
}

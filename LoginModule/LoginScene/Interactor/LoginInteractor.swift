//
//  LoginInteractor.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class LoginInteractor {
    // It seems like firebase accepts special characters, we just add this layer in order
    // to add complexity to the project and stay prepared for your requirements 
    fileprivate let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    fileprivate let passwordRegex = "^.{8}$"
}

// MARK: - LoginInteractorInjection
extension LoginInteractor: LoginInteractorInjection {
    func validate(email: String?, password: String?) -> (isEmailValid: RequirementState, isPasswordValid: RequirementState) {
        return (isEmailValid: validateEmail(email), isPasswordValid: validatePassword(password))
    }
    
    private func validatePassword(_ password: String?) -> RequirementState {
        guard let password = password, password != "" else { return .empty }
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let passwordValidation = passwordPredicate.evaluate(with: password)
        
        return passwordValidation ? .valid : .invalid
    }
    
    private func validateEmail(_ email: String?) -> RequirementState {
        guard let email = email, email != "" else { return .empty }
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let emailValidation = emailPredicate.evaluate(with: email)
        
        return emailValidation ? .valid : .invalid
    }
}

//
//  LoginResources.swift
//  LoginModule
//
//  Created by Sergio Garre on 01/12/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

// At this moment the strings are hard coded, in your personal projects this constants
// could point to the NSLocalizedString translated strings
struct LoginResources {
    // View states
    static let title = "Login Module"
    static let leadingPlaceholder = "e-mail"
    static let trailingPlaceholder = "password"
    static let actionButtonSigninTitle = "sign in"
    static let actionButtonSignOutTitle = "sign out"
    static let actionButtonCreateUserTitle = "Create user"
    static let bottomNeedToCreateAccountTitle = "I don't have an account yet"
    static let bottomHaveAlreadyAnAccountTitle = "I have already an account"
    
    // Error states
    static let emailNotValid = "The email address is badly formatted"
    static let passwordNotValid = "The password must be 6 characters long or more"
    static let emailAndPasswordNotValid = "The email address is badly formatted and the password must be 6 characters long or more"
    static let emailEmpty = "You should type an email"
    static let passwordEmpty = "You should type a password"
    static let emailAndPasswordEmpty = "You should type an email and password"
}

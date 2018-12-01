//
//  LoginEntities.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

// MARK: - LoginViewInjectionModel

//The view model which will be injected to the view
struct LoginViewInjectionModel {
    let title: String
    let leadingPlaceholder: String
    let trailingPlaceholder: String
    let actionButtonTitle: String
    let bottomTitle: String
    
    // The normal flow is to set as 'Create user' the first state of the view
    init(title: String = LoginResources.title,
         leadingPlaceholder: String = LoginResources.leadingPlaceholder,
         trailingPlaceholder: String = LoginResources.trailingPlaceholder,
         actionButtonTitle: String = LoginResources.actionButtonCreateUserTitle) {
        
        self.title = title
        self.leadingPlaceholder = leadingPlaceholder
        self.trailingPlaceholder = trailingPlaceholder
        self.actionButtonTitle = actionButtonTitle
        
        // We can easily figure out which strings fits with the bottom title
        // evaluating the string of the button
        if actionButtonTitle == LoginResources.actionButtonCreateUserTitle {
            bottomTitle = LoginResources.bottomHaveAlreadyAnAccountTitle
        } else {
            bottomTitle = LoginResources.bottomNeedToCreateAccountTitle
        }
    }
}

// MARK: - LoginViewInjectionModel

// The view model which the view will send when the user
// makes some interaction over the UI
struct LoginViewDelegateModel {
    let leadingText: String?
    let trailingText: String?
    let bottomState: BottomState
    
    init?(leadingText: String?,
         trailingText: String?,
         actionButtonTitle: String?) {
        
        self.leadingText = leadingText
        self.trailingText = trailingText
        
        // Evaluate the title of the button in order to define the logic which
        // will be executed when the object sends the message to the delegate
        if let actionButtonTitle = actionButtonTitle {
            if actionButtonTitle == LoginResources.actionButtonCreateUserTitle {
                bottomState = .createUser
            } else if actionButtonTitle == LoginResources.actionButtonSigninTitle {
                bottomState = .signIn
            } else {
                bottomState = .signOut
            }
        } else {
            return nil
        }
    }
}

// The way in which the scene works
enum BottomState {
    case createUser
    case signIn
    case signOut
}

enum RequirementState {
    case empty
    case invalid
    case valid
}

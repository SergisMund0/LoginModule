//
//  FirebaseErrorHandler.swift
//  LoginModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation
import FirebaseAuth

final class FirebaseErrorHandler {
    
    func processFirebaseErrorCode(_ error: NSError) {
        guard let error = AuthErrorCode(rawValue: error.code) else {
            // Generic error state
            return
        }
        
        if error == AuthErrorCode.invalidEmail {
            
        } else if error == AuthErrorCode.emailAlreadyInUse {
            
        } else if error == AuthErrorCode.operationNotAllowed {
            
        } else if error == AuthErrorCode.weakPassword {
            
        }
    }
}

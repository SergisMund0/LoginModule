//
//  LoginEntities.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

struct LoginViewModel {
    let leadingString: String?
    let trailingString: String?
    let bottomState: BottomState
}

enum BottomState {
    case createUser
    case signIn
}

//
//  ErrorEntities.swift
//  LoginModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

struct ErrorViewModel {
    let titleString: String
    let bottomButtonString: String
    
    init(titleString: String, bottomButtonString: String = "Retry") {
        self.titleString = titleString
        self.bottomButtonString = bottomButtonString
    }
}

//
//  ErrorEntities.swift
//  LoginModule
//
//  Created by Sergio Garre on 29/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

struct ErrorViewInjectionModel {
    let title: String
    let subtitle: String
    let bottomButtonTitle: String
    
    init(title: String = ErrorResources.title, subtitle: String, bottomButtonTitle: String = ErrorResources.bottomButtonTitle) {
        self.title = title
        self.subtitle = subtitle
        self.bottomButtonTitle = bottomButtonTitle
    }
}

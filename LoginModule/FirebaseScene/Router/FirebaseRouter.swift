//
//  FirebaseRouter.swift
//  LoginModule
//
//  Created by Sergio Garre on 23/11/2018.
//  Copyright © 2018 Sergio Garre. All rights reserved.
//

import Foundation

final class FirebaseRouter: FirebaseRouterInjection {
    static func setup() -> FirebaseInteractorInjection {
        let interactor: FirebaseInteractorInjection = FirebaseInteractor.shared
        
        return interactor
    }
}

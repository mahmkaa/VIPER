//
//  WelcomeRouter.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    
}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var presenter: WelcomePresenterProtocol?
}

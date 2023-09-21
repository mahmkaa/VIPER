//
//  WelcomeInteractor.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    weak var presenter: WelcomePresenterProtocol?
}

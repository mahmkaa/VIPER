//
//  WelcomePresenter.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    var router: WelcomeRouterProtocol
    var interactor: WelcomeInteractorProtocol
    
    init(interactor: WelcomeInteractorProtocol, router: WelcomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
    func viewDidLoaded() {
        //start loading info
    }
}

//
//  WelcomeModuleBuilder.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import UIKit

class WelcomeModuleBuilder {
    static func build() -> ViewController {
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main") as! ViewController
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

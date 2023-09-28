//
//  WelcomePresenter.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didTapImageButton()
    func didLoad(date: String?)
    func didLoad(weather: Int?)
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
    func didTapImageButton() {
        let temperature = interactor.temperature
        router.openImage(for: temperature)
    }
    
    func viewDidLoaded() {
        interactor.loadDate()
        interactor.loadWeather()
    }
    
    func didLoad(date: String?) {
        view?.showDate(date: date ?? "No date today")
    }
    func didLoad(weather: Int?) {
        let temperature = weather?.description ?? "No temperature"
        view?.showWeather(weather: temperature)
    }
}

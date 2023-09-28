//
//  ImageViewerPresenter.swift
//  Super easy dev
//
//  Created by Павел Петров on 28.09.2023
//

import UIKit

protocol ImageViewerPresenterProtocol: AnyObject {
    func viewDidloaded()
}

class ImageViewerPresenter {
    weak var view: ImageViewerViewProtocol?
    var router: ImageViewerRouterProtocol
    var interactor: ImageViewerInteractorProtocol

    init(interactor: ImageViewerInteractorProtocol, router: ImageViewerRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ImageViewerPresenter: ImageViewerPresenterProtocol {
    func viewDidloaded() {
        let image = interactor.getImageForCurrentTemperature()
        view?.showImage(image: image)
    }
    
}

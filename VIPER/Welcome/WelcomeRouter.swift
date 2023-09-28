//
//  WelcomeRouter.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    func openImage(for temperature: Int)
}

class WelcomeRouter: WelcomeRouterProtocol {
    func openImage(for temperature: Int) {
        let vc = ImageViewerModuleBuilder.build(temperature: temperature)
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    weak var viewController: ViewController?
}

//
//  ViewController.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    
}

class ViewController: UIViewController {
    var presenter: WelcomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: WelcomeViewProtocol {
    
}

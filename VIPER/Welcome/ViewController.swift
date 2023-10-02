//
//  ViewController.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showDate(date: String)
    func showWeather(weather: String)
}

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    
    var presenter: WelcomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        
        showButton.backgroundColor = .systemBlue
        showButton.setTitle("Show image", for: .normal)
        showButton.setTitleColor(.white, for: .normal)
        showButton.layer.cornerRadius = 10
        showButton.layer.borderWidth = 1.0
        showButton.layer.borderColor = UIColor.blue.cgColor
    }
    @IBAction func didTapImageButton(_ sender: Any) {
        presenter?.didTapImageButton()
    }
}

extension ViewController: WelcomeViewProtocol {
    func showDate(date: String) {
        DispatchQueue.main.async {
            self.dateLabel.text = date
        }
    }
    
    func showWeather(weather: String) {
        DispatchQueue.main.async {
            self.weatherLabel.text = weather
        }
    }
    
    
}

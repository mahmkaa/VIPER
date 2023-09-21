//
//  WeatherService.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import Foundation

class WeatherService {
    func getWeather(compltion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let temperature = Int.random(in: -30...30)
            compltion(temperature)
        }
    }
}

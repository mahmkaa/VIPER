//
//  DateService.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import Foundation

class DateService {
    func getDate(completion: @escaping (Date) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(Date())
        }
    }
}

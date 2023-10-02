//
//  DateService.swift
//  VIPER
//
//  Created by Павел Петров on 21.09.2023.
//

import Foundation
import CoreLocation

class DateService: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .authorizedWhenInUse:
//            //ffd
//        case .denied, .restricted:
//            //fff
//        case.notDetermined:
//            //ffe
//            locationManager.requestWhenInUseAuthorization()
//        default:
//            break
//        }
//    }
    
    func getLocation(completion: @escaping (CLLocation?) -> Void) {
        if CLLocationManager.locationServicesEnabled() {
            completion(locationManager.location)
        } else {
            completion(nil)
        }
    }
    
    func getDate(completion: @escaping (Date?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            getLocation { location in
                guard let location = location else {
                    completion(nil)
                    return
                }
                
                let geocoder = CLGeocoder()
                geocoder.reverseGeocodeLocation(location) { placemarks, error in
                    if let error = error {
                        print("Проблема определения местоположения")
                        completion(nil)
                    } else if let placemark = placemarks?.first {
                        let timeZone = placemark.timeZone ?? TimeZone.current
                        let currentDate = Date()
                        let locationDate = currentDate.inTimeZone(timeZone)
                        completion(locationDate)
                    } else {
                        completion(nil)
                    }
                }
            }
        }
    }
}

extension Date {
    func inTimeZone(_ timeZone: TimeZone) -> Date {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents(in: timeZone, from: self)
        return calendar.date(from: dateComponents) ?? self
    }
}

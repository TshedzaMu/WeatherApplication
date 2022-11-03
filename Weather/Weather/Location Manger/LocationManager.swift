//
//  LocationManager.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2022/11/02.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    private var locationManager:CLLocationManager?
    var completion: ((CLLocation) -> Void)?
    
    func getUserLocation(completion: @escaping ((CLLocation) -> Void)) {
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self
        self.completion = completion
        locationManager?.allowsBackgroundLocationUpdates = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            completion?(location)
            locationManager?.stopUpdatingLocation()
            print("Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)")
        }
    }
}

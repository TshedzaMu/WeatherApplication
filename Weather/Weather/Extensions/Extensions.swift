//
//  Extensions.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2022/11/04.
//
import UIKit
import Foundation


extension UserDefaults {
    private enum Keys {
        static let favorites = "favorites"
    }
    
    static var savedfavorites: [CurrentWeatherResponse] {
        get {
            guard let data = UserDefaults.standard.data(forKey: Keys.favorites) else {return []}
            do {
                let decoder = JSONDecoder()
                let weatherLocations = try decoder.decode([CurrentWeatherResponse].self, from: data)
                print("Retrieved")
                print(weatherLocations)
                return weatherLocations
            } catch {
                return []
            }
        }
        set {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(newValue)
                UserDefaults.standard.set(data, forKey: Keys.favorites)
                print("Saved")
            } catch {
                print("Unable to Encode countires (\(error))")
            }        }
    }
    
    static func addToFavorites(_ weather: CurrentWeatherResponse) {
        var currentFavorites = UserDefaults.savedfavorites
        currentFavorites.append(weather)
        print("saved")
        UserDefaults.savedfavorites = currentFavorites
    }
    
    static func isFavorite(_ weather: CurrentWeatherResponse?) -> Bool {
        let favorites = UserDefaults.savedfavorites
        guard let weather = weather else  { return false }
        return favorites.contains(weather)
    }
}


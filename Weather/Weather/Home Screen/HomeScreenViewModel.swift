//
//  HomeScreenViewModel.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2021/09/23.
//

import Foundation
import UIKit

class HomeScreenViewModel {
    
    var service = Service()
    var currentWeather = CurrentWeatherResponse()
    var forecastWeather = ForecastWeatherResponse()
    var dates = [String]()
    var long: Float?
    var lat: Float?
    
    var description: String {
        return currentWeather.weather?.first?.description ?? ""
    }
    
    var mainWeatherDescription: String {
        return currentWeather.weather?.first?.main ?? ""
    }
    
    var currentTemp: String {
        guard let currentTemp = currentWeather.main?.temp else {
              return ""
          }
        return String(format:"%.0f", currentTemp)
    }
    
    var minTemp: String {
        guard let mainTemp = currentWeather.main?.temp_min else {
              return ""
          }
        return String(format:"%.0f", mainTemp)
    }
    
    var maxTemp: String {
        guard let maxTemp = currentWeather.main?.temp_max else {
              return ""
          }
        return String(format:"%.0f", maxTemp)
    }
    
    var listCount: Int {
        return forecastWeather.list?.count ?? Int()
    }
        
    var weatherArray: [Forecast] {
        return forecastWeather.list ?? []
    }
    
    var tempArray: [String] {
        var temps = [String]()
        for weather in weatherArray {
            guard let forecastTemp = weather.main?.temp else {
                  return []
              }
            let temp = String(format:"%.0f", forecastTemp)
            temps.append(temp)
        }
        return temps
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func fetchWeather(completed: @escaping () ->()) {
        DispatchQueue.main.async {
            self.service.getCurrentWeather(long: self.long ?? Float(), lat: self.lat ?? Float()) { (response, error) in
                self.currentWeather = response ?? CurrentWeatherResponse()
                completed()
            }
            self.service.getWeatherForecast(long: self.long ?? Float(), lat: self.lat ?? Float()) { (response, error) in
                self.forecastWeather = response ?? ForecastWeatherResponse()
                completed()
            }
        }
    }
}

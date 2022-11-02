//
//  HomeScreenViewModel.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2021/09/17.
//

import Foundation

class Service {
    
    typealias currentSuccess = (CurrentWeatherResponse?, _ error: String?) ->()
    typealias forecastSuccess = (ForecastWeatherResponse?, _ error: String?) ->()
    
    func getCurrentWeather(long: String, lat: String, completed: @escaping currentSuccess) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Johannesburg&appid=578feca10a590e86711974e85a838e7b&units=metric")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            print(data.count)
            let currentWeather = try? JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
            
            DispatchQueue.main.async {
                completed(currentWeather, nil)
            }
        }
        task.resume()
    }
    
    func getWeatherForecast(long: String, lat: String, completed: @escaping forecastSuccess) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Johannesburg&appid=578feca10a590e86711974e85a838e7b&units=metric")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            print(data.count)
            let forecastWeather = try? JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
            
            DispatchQueue.main.async {
                completed(forecastWeather, nil)
            }
        }
        task.resume()
    }
}

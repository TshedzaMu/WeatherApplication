//
//  HomeScreenViewModel.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2021/09/17.
//

import Foundation

class Service {
//
//    typealias currentSuccess = (CurrentWeatherResponse?, _ error: String?) ->()
//    typealias forecastSuccess = (ForecastWeatherResponse?, _ error: String?) ->()
//
//    func getCurrentWeather(long: String, lat: String, completed: @escaping currentSuccess) {
//        AF.request("https://api.openweathermap.org/data/2.5/weather?q=Johannesburg&appid=578feca10a590e86711974e85a838e7b&units=metric")
//            .responseJSON { response in
//                guard response.error == nil else {
//                    print(response.error!)
//                    completed(nil, (response.error?.errorDescription)!)
//                    return
//                }
//                guard let data = response.data else {
//                    print("No Data")
//                    return
//                }
//                do {
//                    let decoder = JSONDecoder()
//                    let currentWeather = try decoder.decode(CurrentWeatherResponse.self, from: data)
//                    completed(currentWeather, nil)
//                } catch {
//                    print(error)
//                }
//            }
//    }
//
//    func getWeatherForecast(long: String, lat: String, completed: @escaping forecastSuccess) {
//        AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Johannesburg&appid=578feca10a590e86711974e85a838e7b&units=metric")
//            .responseJSON { response in
//                guard response.error == nil else {
//                    completed(nil, (response.error?.errorDescription)!)
//                    print(response.error!)
//                    return
//                }
//                guard let data = response.data else {
//                    print("No Data")
//                    return
//                }
//                do {
//                    let decoder = JSONDecoder()
//                    let forecastWeather = try decoder.decode(ForecastWeatherResponse.self, from: data)
//                    completed(forecastWeather, nil)
//
//                } catch {
//                    print(error)
//                }
//            }
//
//    }
//
}

//
//  WeatherResponse.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2021/09/18.
//

import Foundation

struct CurrentWeatherResponse: Decodable {
    var main: MainData?
    var weather: [WeatherData]?
}

struct WeatherData: Decodable {
    var main: String?
    var description: String?
}

struct MainData: Decodable {
    var temp_max: Double?
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
}

struct Forecast: Decodable {
    var dt_txt: String?
    var main: MainData?
    var weather: [WeatherData]?
}

struct ForecastWeatherResponse: Decodable {
    var list: [Forecast]?
}

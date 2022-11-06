//
//  WeatherResponse.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2021/09/18.
//

import Foundation

struct CurrentWeatherResponse: Codable, Equatable {
    static func == (lhs: CurrentWeatherResponse, rhs: CurrentWeatherResponse) -> Bool {
        return lhs.name == rhs.name
    }
    
    var coord: Coordinates?
    var name: String?
    var main: MainData?
    var weather: [WeatherData]?
}

struct WeatherData: Codable {
    var main: String?
    var description: String?
}

struct Coordinates: Codable {
    var lon: Float?
    var lat: Float?
}

struct MainData: Codable {
    var temp_max: Double?
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
}

struct Forecast: Codable {
    var dt_txt: String?
    var main: MainData?
    var weather: [WeatherData]?
}

struct ForecastWeatherResponse: Codable {
    var list: [Forecast]?
}

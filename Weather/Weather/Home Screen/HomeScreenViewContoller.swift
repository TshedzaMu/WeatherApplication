//
//  HomeScreenViewContoller.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2021/09/17.
//

import Foundation
import UIKit

class HomeScreeViewContoller: UIViewController {
    
    @IBOutlet private var mainCurrentLabel: UILabel!
    @IBOutlet private var mainDescriptionLabel: UILabel!
    @IBOutlet private var wetherTableView: UITableView!
    @IBOutlet private var minimumTempLabel: UILabel!
    @IBOutlet private var currentTempLabel: UILabel!
    @IBOutlet private var maximimTempLabel: UILabel!
    @IBOutlet weak var mainWeatherImageView: UIImageView!
    @IBOutlet weak var mainWeatherStackView: UIStackView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private lazy var viewModel = HomeScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wetherTableView.delegate = self
        wetherTableView.dataSource = self
        
        LocationManager.shared.getUserLocation { location in
            DispatchQueue.main.async {
                let lat = location.coordinate.latitude
                let long = location.coordinate.longitude
                print(lat)
                print(long)
                self.viewModel.lat = Float(lat)
                self.viewModel.long = Float(long)
                self.setupUI()
            }
            
        }
    }
    
    private func setupUI() {
        viewModel.fetchWeather {
            self.mainCurrentLabel.text = ("\(self.viewModel.currentTemp)\("℃")")
            self.currentTempLabel.text = ("\(self.viewModel.currentTemp)\("℃")")
            self.mainDescriptionLabel.text = self.viewModel.description
            self.minimumTempLabel.text = ("\(self.viewModel.minTemp)\("℃")")
            self.maximimTempLabel.text = ("\(self.viewModel.maxTemp)\("℃")")
            self.setupViewTheme(mainCondition: self.viewModel.mainWeatherDescription)
            self.wetherTableView.reloadData()
        }
    }
    
    private func setupViewTheme(mainCondition: String) {
        switch mainCondition {
        case "Clouds":
            mainWeatherImageView.image = UIImage(named: "cloudy")
            mainWeatherStackView.backgroundColor = viewModel.hexStringToUIColor(hex: "#9AB5CF")
            view.backgroundColor = viewModel.hexStringToUIColor(hex: "#9AB5CF")
        case "Clear":
            mainWeatherImageView.image = UIImage(named: "Sunny")
            mainWeatherStackView.backgroundColor = viewModel.hexStringToUIColor(hex: "#3BA0FD")
            view.backgroundColor = viewModel.hexStringToUIColor(hex: "#3BA0FD")
        case "Rain":
            mainWeatherImageView.image = UIImage(named: "rainny")
            mainWeatherStackView.backgroundColor = viewModel.hexStringToUIColor(hex: "#878787")
            view.backgroundColor = viewModel.hexStringToUIColor(hex: "#878787")
        default:
            break
        }
    }
    
    @IBAction private func addToFavorites(_ sender: Any) {
        //viewModel.savefavorite(weather: viewModel.currentWeather)
        viewModel.updateFavorites()
        //  favoriteButton = viewModel.rightBarButtonImage()
    }
}

extension HomeScreeViewContoller: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WEATHER_CELL", for: indexPath) as! WeatherTableViewCell
        cell.setWeatherForecast(weekday: viewModel.forecastWeather.list?[indexPath.row].dt_txt ?? "",
                                imageIcon: String((viewModel.weatherArray[indexPath.row].weather?.first?.main)!),
                                temparature: viewModel.tempArray[indexPath.row])
        cell.setCellBacground(condition: viewModel.mainWeatherDescription)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
}

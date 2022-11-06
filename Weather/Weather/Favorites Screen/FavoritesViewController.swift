//
//  FavoritesViewController.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2022/11/03.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    var delegate: MainTabBarDelegate?
    
    @IBOutlet weak var NoFavouritesText: UILabel!
    var viewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }

    func setupView() {
        viewModel.resetFavorites()
        if viewModel.favoriteListCount == 0 {
            NoFavouritesText.text = "No favorite weather locations"
            favoritesTableView.isHidden = true
        } else {
            favoritesTableView.isHidden = false
            favoritesTableView.reloadData()
        }
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoriteListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAVORITE_WEATHER_CELL", for: indexPath) as! FavoriteWeatherTableViewCell
        cell.favoriteWeatherLocation.text = viewModel.favoritesList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWeatherLocation =  viewModel.favoritesList[indexPath.row]
        delegate?.transitionToHomeScreen(with: selectedWeatherLocation)
    }
}

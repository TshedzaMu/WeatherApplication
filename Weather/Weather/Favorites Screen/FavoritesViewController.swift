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
    
    //var delegate: MainTabBarDelegate?
    
    @IBOutlet weak var stackView: UIStackView!
    var viewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   //     self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundC.png") ?? UIImage())
        setupView()
    }
    
    //    func showNoFavoriteMessage() {
    //        guard let view = CountriesDetailsView.loadView() else { return }
    //        view.setupView(details: viewModel.noFavoriteMessage)
    //        view.backgroundColor = .white
    //        stackView.addArrangedSubview(view)
    //    }
    
    func setupView() {
        viewModel.resetFavorites()
        if viewModel.favoriteListCount == 0 {
            //  clearStackView()
            // showNoFavoriteMessage()
            favoritesTableView.isHidden = true
        } else {
            // clearStackView()
            // favoritesTableView.isHidden = false
            favoritesTableView.reloadData()
        }
    }
    
    func clearStackView() {
        for view in stackView.subviews {
            view.removeFromSuperview()
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
        let selectedCountry =  viewModel.favoritesList[indexPath.row]
        //  delegate?.transitionToHomeScreen(with: selectedCountry)
    }
}

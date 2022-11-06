//
//  MainTabBarController.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2022/11/03.
//
import UIKit

protocol MainTabBarDelegate {
    func transitionToHomeScreen(with selectedLocation: CurrentWeatherResponse?)
}

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSelectionDelegate()
    }
    
    func addSelectionDelegate() {
        if let favoriteNav = viewControllers?[1] as? UINavigationController {
            guard let favoriteController = favoriteNav.viewControllers.first as? FavoritesViewController else { return }
            favoriteController.delegate = self
        }
    }
}

extension MainTabBarController: MainTabBarDelegate {
    func transitionToHomeScreen(with selectedLocation: CurrentWeatherResponse?) {
        if let homeNav = viewControllers?[0] as? UINavigationController {
            guard let homeViewController = homeNav.viewControllers.first as? HomeScreenViewContoller else { return }
            homeViewController.update(with: selectedLocation)
            self.selectedIndex = 0
        }
    }
}

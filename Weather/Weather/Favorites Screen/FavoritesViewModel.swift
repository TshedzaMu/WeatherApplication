//
//  FavoritesViewModel.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2022/11/03.
//

import Foundation

import Foundation

class FavoritesViewModel {
    
    var favoritesList = UserDefaults.savedfavorites
    
    var favoriteListCount: Int {
        return favoritesList.count
    }
    
    func resetFavorites() {
        favoritesList = UserDefaults.savedfavorites
    }
}

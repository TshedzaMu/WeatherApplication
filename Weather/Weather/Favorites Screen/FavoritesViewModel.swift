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
    
//    var noFavoriteMessage: CountryDetails {
//        return CountryDetails(header: "Please note", details: ["You current do not have any favorite country"])
//    }
}

//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Tshedza Musandiwa on 2021/09/21.
//

import Foundation
import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet var weekDayTextLabel: UILabel!
    @IBOutlet private var weatherImageicon: UIImageView!
    @IBOutlet private var temparatureTextLabel: UILabel!
    
    func setWeatherForecast(weekday: String,
                     imageIcon: String,
                     temparature: String) {
        weekDayTextLabel.text = weekday
        weatherImageicon.image = UIImage(named: imageIcon)
        temparatureTextLabel.text = "\(temparature)\("℃")"
    }
    
    func setCellBacground(condition: String) {
        switch condition {
        case "Clouds":
            self.backgroundColor = hexStringToUIColor(hex: "#9AB5CF")
        case "Clear":
            self.backgroundColor = hexStringToUIColor(hex: "#3BA0FD")
        case "Rain":
            self.backgroundColor = hexStringToUIColor(hex: "#878787")
        default:
            break
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

//
//  Util.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/10/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

typealias CityCompletion = (_ success: Bool, _ city: CityDataProtocol?) -> Void

enum WeatherUnits : String {
    case metric = "&units=metric"
    case imperial = "&units=imperial"
    case standard = ""
}

class Util {
    static let apiKey : String = "ca6bab2b6a355e2e6b28571c73035059"
    
    static let dataRefreshNotification = "dataRefreshNotification"

    
    static func iconWeather(code:Int) -> (icon:UIImage, background:UIImage) {
        switch code {
        case 200..<300:
            return (UIImage(named: "tormenta-icon")!, UIImage(named: "tormenta")!)
        case 300..<400:
            return (UIImage(named: "llovizna-icon")!, UIImage(named: "llovizna")!)
        case 500..<600:
            return (UIImage(named: "lluvia-icon")!, UIImage(named: "lluvia")!)
        case 600..<700:
            return (UIImage(named: "nieve-icon")!, UIImage(named: "nieve")!)
        case 700..<800:
            return (UIImage(named: "niebla-icon")!, UIImage(named: "niebla")!)
        case 800:
            return (UIImage(named: "soleado-icon")!, UIImage(named: "soleado")!)
        case 801..<810:
            return (UIImage(named: "nublado-icon")!, UIImage(named: "nublado")!)
        default:
            return (UIImage(named: "soleado-icon")!, UIImage(named: "soleado")!)
        }
    }
    
    static func getFormattedDate(from date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let result = formatter.string(from: date)
        
        return result
    }
}

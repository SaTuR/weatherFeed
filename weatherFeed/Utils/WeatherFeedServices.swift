//
//  WeatherFeedServices.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/10/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class WeatherFeedServices {
    static let shared = WeatherFeedServices()
    
    let baseUrl = "http://api.openweathermap.org/data/2.5/forecast"
    
    var unit : WeatherUnits = .metric
    
    
    func weatherData(with cityName:String, completionHandler:@escaping CityCompletion) {
        let address = "\(self.baseUrl)?q=\(cityName)&mode=json&appid=\(Util.apiKey)\(self.unit.rawValue)&lang=es"
        if let escapedAddress = address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            let session = URLSession.shared
            if let url = URL(string: escapedAddress) {
                let task = session.dataTask(with: url) { (data, response, error) in
                    guard (error == nil) else {
                        completionHandler(false, nil)
                        return
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                        
                        let city = self.getCityDataFrom(dictionary: json)
                        
                        completionHandler(true, city)
                    } catch {
                        completionHandler(false, nil)
                        return
                    }
                    
                }
                
                task.resume()
            }
        }
    }
    
    
    func getCityDataFrom(dictionary: [String:AnyObject]) -> CityDataProtocol? {
        if let resultCity = dictionary["city"] as? [String:AnyObject] {
            let name = resultCity["name"] as! String
            let countryISO = resultCity["country"] as! String

            var forecasts = [ForecastData]()

            if let forecastsCity = dictionary["list"] as? [[String:AnyObject]] {
                for forecastData in forecastsCity {
                    var minimunTemperature = 0.0
                    var maximumTemperature = 0.0
                    var currentTemperature = 0.0
                    let date = Date(timeIntervalSince1970: (forecastData["dt"] as! Double))
                    if let main = forecastData["main"] as? [String:AnyObject] {
                        minimunTemperature = main["temp_min"] as! Double
                        maximumTemperature = main["temp_max"] as! Double
                        currentTemperature = main["temp"] as! Double
                    }
                    
                    var weatherCode = 0
                    var weatherDescription = ""
                    if let weathers = forecastData["weather"] as? [[String:AnyObject]] {
                        let weather = weathers[0]
                        weatherCode = weather["id"] as! Int
                        weatherDescription = weather["description"] as! String
                    }
                    
                    let forecast = ForecastData(code: weatherCode, minimum: minimunTemperature, maximum: maximumTemperature, current: currentTemperature, description: weatherDescription, date: date)
                    forecasts.append(forecast)
                }
            }

            let city = CityData(name: name, countryISO: countryISO, forecast:forecasts)
            return city
        }
        
        return nil
    }

}

//
//  WeatherCollectionViewCell.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/12/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var fullContainer: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var forecastTable: UITableView!
    
    static let identifier = "WeatherCell"
    
    var city: CityDataProtocol!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = self.city {
            return data.forecast.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as! ForecastTableViewCell
        
        //TODO: Tu código aquí
        cell.dateLabel.text = Util.getFormattedDate(from: city.forecast[indexPath.row].date, format: "EEEE, d MMMM yyyy, hh:mm:ss a")
        cell.descriptionLabel.text = city.forecast[indexPath.row].description
        cell.temperatureLabel.text = city.forecast[indexPath.row].current.description + " ºC (" + city.forecast[indexPath.row].minimum.description  + " - " + city.forecast[indexPath.row].maximum.description + ")"
        //cell.iconImageView?.image = Util.iconWeather(code: city.forecast[indexPath.row].code
        let resultado3 = Util.iconWeather(code: city.forecast[indexPath.row].code)
        cell.iconImageView.image = resultado3.icon
        backgroundImageView.image = resultado3.background
        return cell
    }
}

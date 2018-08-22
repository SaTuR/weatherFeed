//
//  CityData.swift
//  weatherFeed
//
//  Created by Jose Cordova on 14/8/18.
//  Copyright © 2018 Ihonahan Buitrago. All rights reserved.
//

import Foundation
struct CityData : CityDataProtocol {
    var name: String!
    var countryISO: String!
    var forecast:[ForecastData]!
    
    init(){
    }
    
    init(name: String, countryISO: String, forecast:[ForecastData]){
        self.name = name
        self.countryISO = countryISO
        self.forecast = forecast
    }
}

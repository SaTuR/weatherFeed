//
//  CityDataProtocol.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/10/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

protocol CityDataProtocol {
    //TODO: Tu código aquí
    
    var name: String! { get }
    var countryISO: String! { get }
    var forecast:[ForecastData]! { get }
}

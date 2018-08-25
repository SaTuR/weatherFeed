//
//  CitiesTableDelegate.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/11/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

protocol CitiesTableDelegate {
    //TODO: Tu código aquí
    
    func addCity(city : CityDataProtocol)
    
    func deleteCity(index : Int)
    
}

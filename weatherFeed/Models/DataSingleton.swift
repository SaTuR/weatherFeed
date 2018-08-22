//
//  DataSingleton.swift
//  weatherFeed
//
//  Created by Jose Cordova on 14/8/18.
//  Copyright © 2018 Ihonahan Buitrago. All rights reserved.
//

import Foundation

class DataSingleton{
    static let shared = DataSingleton()
    
    var City : [CityDataProtocol] = [CityDataProtocol] ()
    var delegate : CitiesTableDelegate!

    private init(){}
    
    func getAllNames()-> [CityDataProtocol]
    {
        return self.City
    }
    
}

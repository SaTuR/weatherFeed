//
//  ForecastData.swift
//  weatherFeed
//
//  Created by Jose Cordova on 14/8/18.
//  Copyright © 2018 Ihonahan Buitrago. All rights reserved.
//

import Foundation
struct ForecastData : ForecastDataProtocol {
    var code: Int
    var minimum: Double
    var maximum: Double
    var current: Double
    var description: String
    var date: Date
    
    init(code: Int, minimum: Double, maximum: Double, current: Double, description: String, date: Date){
        self.code = code
        self.minimum = minimum
        self.maximum = maximum
        self.current = current
        self.description = description
        self.date = date
    }
    
}

//
//  ForecastDataProtocol.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/10/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

protocol ForecastDataProtocol {
    //TODO: Tu código aquí
    
    var code: Int { get }
    var minimum: Double { get }
    var maximum: Double { get }
    var current: Double { get }
    var description: String { get }
    var date: Date { get }
}

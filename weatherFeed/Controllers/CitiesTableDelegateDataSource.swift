//
//  CitiesTableDelegateDataSource.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/11/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class CitiesTableDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    var delegate: CitiesTableDelegate!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Tu código aquí
        return DataSingleton.shared.City.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.identifier, for: indexPath) as! CitiesTableViewCell
        
        //TODO: Tu código aquí
        cell.cityLabel?.text = DataSingleton.shared.City[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegate.deleteCity(index: indexPath.row)
        }
    }
}

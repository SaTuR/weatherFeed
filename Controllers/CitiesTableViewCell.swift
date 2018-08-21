//
//  CitiesTableViewCell.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/11/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    
    static let identifier = "CityCell"
    
    @IBOutlet weak var fullContainer: UIView!
    @IBOutlet weak var cityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

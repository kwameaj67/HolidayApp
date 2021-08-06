//
//  CountryTableViewCell.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 06/08/2021.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var callingCode: UILabel!
    
    
    func setupCountry(item: Country){
        name.text = item.name
        callingCode.text = "+\(item.callingCodes[0])"
    }
}

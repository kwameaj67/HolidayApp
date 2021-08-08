//
//  HolidayTableViewCell.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 28/07/2021.


import UIKit

class HolidayTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    func setup(item:HolidayDetail){
        let isoDate = item.date.iso
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.dateFormat = "yyyy-MM-dd"

        let date = inputFormatter.date(from: isoDate!)
        inputFormatter.dateStyle = .long
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EEEE, MMMM d, yyyy"
        if let mydate = date {
            let finalDate = outputFormatter.string(from: mydate)
              subTitleLabel.text = finalDate
              print(finalDate)
          }
        titleLabel.text = item.name  
        
    }
    
}

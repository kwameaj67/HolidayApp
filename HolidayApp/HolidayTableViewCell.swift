//
//  HolidayTableViewCell.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 28/07/2021.


import UIKit

class HolidayTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
//    func convertDateFormat(inputDate: String) -> String {
//
//         let oldDateFormatter = DateFormatter()
//         oldDateFormatter.dateFormat = "yyyy-MM-dd"
//
//         let oldDate = oldDateFormatter.date(from: inputDate)
//
//         let convertDateFormatter = DateFormatter()
//         convertDateFormatter.dateFormat = "EEEE, MMM d, yyyy"
//
//        return convertDateFormatter.string(from: oldDate!)
//    }

   
    func setup(item:HolidayDetail){
        let isoDate = item.date.iso
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        formatter.dateStyle = .long
        
        if let mydate = isoDate {
            formatter.date(from: mydate)
            subTitleLabel.text = mydate
        }
    
        titleLabel.text = item.name

        
       
       
        
        
      
        
    }
    
}

//
//  Holiday.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 28/07/2021.
//

import Foundation
import UIKit

struct HolidayResponse:Decodable {
    let response: Holidays
}

struct Holidays:Decodable {
    let holidays: [HolidayDetail]
}

struct HolidayDetail:Decodable {
    let name: String
    let description:String
    let date:DateInfo
    let type: [String]
}

struct DateInfo:Decodable {
    let iso:String?
}

struct DateTime:Decodable {
    let year: Int
    let month: Int
    let day: Int
}

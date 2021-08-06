//
//  Country.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 05/08/2021.
//

import Foundation


struct Country:Decodable {
    var name: String
    var alpha2Code: String
    var callingCodes:[String]
}


//
//let CountryList:[Country] = [
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Albania", country_code: "335", iso_code: "AL"),
//    Country(name: "Algeria", country_code: "213", iso_code: "DZ"),
//    Country(name: "Australia", country_code: "61", iso_code: "AU"),
//    Country(name: "Bahamas", country_code: "1-242", iso_code: "BS"),
//    Country(name: "Benin", country_code: "229", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//    Country(name: "Afghanistan", country_code: "93", iso_code: "AF"),
//
//
//]

//
//  CountryRequest.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 06/08/2021.
//

import Foundation
import UIKit

enum CountryError:Error{
    case noData
    case serverError
}

struct CountryRequest {
    
    let resourceURL: URL
    let country_api = Constants.API.country_api

    
    init() {
        guard let url = URL(string: country_api) else {fatalError()}
        self.resourceURL = url
    }
    
    func getCountryList(completion: @escaping (Result<[Country],CountryError>) -> Void ){
        URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
            if let err = error {
                print("\(err.localizedDescription)")
                completion(.failure(.serverError))
            }else{
                let countryJsonData =  try? JSONSerialization.jsonObject(with: data!, options: [])
//                print(countryJsonData!)
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            let decoder = JSONDecoder()
            let decodedData = try? decoder.decode([Country].self, from: data)
            completion(.success(decodedData!))
            print(decodedData!)
            
        }.resume()
    }
    
    
    
}

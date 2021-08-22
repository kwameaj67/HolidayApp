//
//  HolidayRequest.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 28/07/2021.


import Foundation
//https://calendarific.com/api-documentation

enum HolidayError:Error{
    case noDataAvailable
    case canNotProcessData
    case serverError
}

struct HolidayRequest {
    let resourceURL:URL
    let API_KEY = Constants.API.holiday_api_key
    
    init(countryCode:String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        let api_string = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        
        guard let url = URL(string: api_string) else {fatalError()}
        
        self.resourceURL = url
    }
    
    func getHolidays(completion: @escaping (Result<[HolidayDetail],HolidayError>) -> Void) {
        URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
            if let err = error {
                print("\(err.localizedDescription)")
                completion(.failure(.serverError))
            }
            else{
                let JSONData = try? JSONSerialization.jsonObject(with: data!, options: [])
                print(JSONData!)
            }
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            let decoder = JSONDecoder()
            let decodedData = try? decoder.decode(HolidayResponse.self, from: jsonData)
//            print(decodedData)
            if let holidayDetailResponse = decodedData?.response.holidays{
                completion(.success(holidayDetailResponse))
            }else{
                completion(.failure(.noDataAvailable))
            }
          
           
        }.resume()
        
    }
    
}

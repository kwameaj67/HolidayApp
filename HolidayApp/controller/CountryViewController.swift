//
//  ContryViewController.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 05/08/2021.
//

import UIKit

class CountryViewController: UIViewController {
    
    @IBOutlet weak var countryTableView: UITableView!
    var CountryList = [Country]() {
        didSet {
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
        }
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCountryRequest()
        countryTableView.delegate = self
        countryTableView.dataSource = self
//        countryTableView.allowsMultipleSelection = true
        countryTableView.allowsSelection = true
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func makeCountryRequest(){
        let countryRequest = CountryRequest()
        countryRequest.getCountryList { [weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success( let countries):
                self?.CountryList = countries
            }
        }
    }
}

extension CountryViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountryList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCode") as! CountryTableViewCell
        let row = CountryList[indexPath.row]
        cell.setupCountry(item: row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
            
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var row = CountryList[indexPath.row]
//        row.isChecked = !row.isChecked
//        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        print("Name:\(row.name)\nCallingCode:\(row.callingCodes[0])\nAlphaCode:\(row.alpha2Code)")
        dismiss(animated: true, completion: nil)
    }
}


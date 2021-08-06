//
//  ViewController.swift
//  HolidayApp
//
//  Created by Kwame Agyenim - Boateng on 28/07/2021.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var selectCountryButton: UIButton!
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
//    var listOfHolidays:[HolidayDetail] = []
    var listOfHolidays = [HolidayDetail]() {
        didSet{
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
                self.navigationController?.navigationBar.prefersLargeTitles = false
                self.navigationItem.title = self.listOfHolidays.count > 0 ? "\(self.listOfHolidays.count) holidays found" : "Holiday App"
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        countryTableView.delegate = self
        countryTableView.dataSource = self
    }
    
    @IBAction func openCountryModal(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "country") as! CountryViewController
        present(vc, animated: true, completion: nil)
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfHolidays.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "code",for: indexPath) as! HolidayTableViewCell
        cell.setup(item:listOfHolidays[indexPath.row])
        return cell
    }
}
extension ViewController:UISearchBarDelegate{
    
    func makeRequest(text: String){
        let holidayRequest = HolidayRequest(countryCode: text)
        holidayRequest.getHolidays { [weak self] result in
            switch result{
            case .failure(let error):
                print("\(error.localizedDescription)")
            case .success(let holidays):
                self?.listOfHolidays = holidays
//                print(self!.listOfHolidays)
            }
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        makeRequest(text: searchText)
    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if(searchText.count > 2){
//            makeRequest(text: searchText)
//        }else{
//            countryTableView.isHidden = false
//           
//        }
//    }
}
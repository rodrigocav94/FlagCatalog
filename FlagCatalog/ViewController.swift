//
//  ViewController.swift
//  FlagCatalog
//
//  Created by Rodrigo Cavalcanti on 14/03/24.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureNavBar()
        populateCountries()
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flag  Catalog"
    }
    
    func populateCountries() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! // iOS projects always habe a resource path.
        let items = try! fm.contentsOfDirectory(atPath: path) // Impossible to run any project without loading the resource content.
        
        for item in items {
            if item.hasSuffix(".png") {
                let itemName = item.replacingOccurrences(of: ".png", with: "").uppercased()
                if let country = Country.all.first(where: {
                    $0.alpha2 == itemName
                }) {
                    countries.append(country)
                }
            }
        }
        countries.sort {
            $0.name < $1.name
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath) as! TableViewCell
        let image = UIImage(named: countries[indexPath.row].alpha2.lowercased())
        
        cell.name.text = countries[indexPath.row].name
        cell.flag.image = image
        
        return cell
    }
    
}


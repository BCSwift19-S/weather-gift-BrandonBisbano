//
//  ListVC.swift
//  WeatherGift
//
//  Created by Brandon Bisbano on 3/11/19.
//  Copyright © 2019 Brandon Bisbano. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class ListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var locationsArray = [String]()
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPageVC" {
            let destination = segue.destination as! PageVC
            currentPage = (tableView.indexPathForSelectedRow?.row)!
            destination.currentPage = currentPage
            destination.locationsArray = locationsArray
        }
    }
}

@available(iOS 11.0, *)
extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        cell.textLabel?.text = locationsArray[indexPath.row]
        return cell
    }
    
    
}

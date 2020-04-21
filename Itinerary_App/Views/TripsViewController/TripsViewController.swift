//
//  TripsViewController.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    
    TripFunctions.readTrips (completion: { [weak self ] in
      //this code gets called when the completion handler gets called, once it has all the data
      self?.tableView.reloadData()
    })
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Data.tripModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    
    if cell == nil {
    cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
    }
    cell?.textLabel?.text = Data.tripModels[indexPath.row].title
    
    return cell!
  }
  

}


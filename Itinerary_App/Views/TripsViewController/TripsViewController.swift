//
//  TripsViewController.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var addButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    TripFunctions.readTrips (completion: { [weak self ] in
      //this code gets called when the completion handler gets called, once it has all the data
      self?.tableView.reloadData()
    })
    
    view.backgroundColor = Theme.background
    addButton.createFloatingActionButton()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toAddTripSegue" {
      let popup = segue.destination as! AddTripViewController
      popup.doneSaving = {
        self.tableView.reloadData()
      }
    }
  }
}

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Data.tripModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
    
    cell.setup(tripModel: Data.tripModels[indexPath.row])
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 160
  }
}




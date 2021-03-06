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
  @IBOutlet var helpView: UIVisualEffectView!
  
  var tripIndextoEdit: Int?
  var seenHelpView = "seenHelpView"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    TripFunctions.readTrips (completion: { [unowned self ] in
      //this code gets called when the completion handler gets called, once it has all the data
      self.tableView.reloadData()
      
      if Data.tripModels.count > 0 {
        if UserDefaults.standard.bool(forKey: self.seenHelpView) == false {
          self.view.addSubview(self.helpView)
          self.helpView.frame = self.view.bounds
        }
      }
    })
    
    view.backgroundColor = Theme.background
    addButton.createFloatingActionButton()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toAddTripSegue" {
      let popup = segue.destination as! AddTripViewController
      popup.tripIndexToEdit = self.tripIndextoEdit
      popup.doneSaving = {
        self.tableView.reloadData()
      }
      tripIndextoEdit = nil
    }
  }
  @IBAction func closeHelpView(_ sender: AppUIButton) {
    UIView.animate(withDuration: 0.5, animations: {
      self.helpView.alpha = 0
    }) { (success) in
      self.helpView.removeFromSuperview()
      UserDefaults.standard.set(true, forKey: self.seenHelpView)
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
  
  //Swipe to Delete
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let trip = Data.tripModels[indexPath.row]
    
    let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
      
      let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip: \(trip.title)?", preferredStyle: .alert)
      
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
        complete(false)
      }))
      
      alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
        //Perform Delete
        TripFunctions.deleteTrip(index: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        complete(true)
      }))
      
      self.present(alert, animated: true)
    }
    return UISwipeActionsConfiguration(actions: [delete])
  }
  
  //Swipe to Edit
  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, complete in
      
      self.tripIndextoEdit = indexPath.row
      self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
      complete(true)
    }
    
    edit.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.3647058824, blue: 0.4666666667, alpha: 1)
    
    return UISwipeActionsConfiguration(actions: [edit])
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let trip = Data.tripModels[indexPath.row]
    
    let vc = ActivitiesViewController.getInstance() as! ActivitiesViewController
    vc.tripId = trip.id
    vc.tripTitle = trip.title
    navigationController?.pushViewController(vc, animated: true)
  }
}




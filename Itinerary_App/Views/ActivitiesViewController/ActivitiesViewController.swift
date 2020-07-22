//
//  ActivitiesViewController.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/16/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//


import UIKit

class ActivitiesViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  var tripId: UUID!
  var tripModel: TripModel?
  var sectionHeaderHeight: CGFloat = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    TripFunctions.readTrip(by: tripId) { [weak self] (model) in
      guard let self = self else { return }
      self.tripModel = model
      
      guard let model = model else { return }
      self.title = model.title
      self.backgroundImageView.image = model.image
      self.tableView.reloadData()
    }
    
    sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: "headerCell")?.contentView.bounds.height ?? 0
  }
  
  @IBAction func back(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
}

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return tripModel?.dayModels.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return sectionHeaderHeight
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let dayModel = tripModel?.dayModels[section]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
    cell.setup(model: dayModel!)
    
    return cell.contentView
  }



  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tripModel?.dayModels[section].activityModels.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
    var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActivityTableViewCell
    
    cell.setup(model: model!)

    return cell
  }


}

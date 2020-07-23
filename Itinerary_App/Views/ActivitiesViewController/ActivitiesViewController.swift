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
  @IBOutlet weak var addButton: AppUIButton!
  
  var tripId: UUID!
  var tripTitle = ""
  var tripModel: TripModel?
  var sectionHeaderHeight: CGFloat = 0.0
  
  fileprivate func updateTableViewWithTripData() {
    TripFunctions.readTrip(by: tripId) { [weak self] (model) in
      guard let self = self else { return }
      self.tripModel = model
      
      guard let model = model else { return }
      self.backgroundImageView.image = model.image
      self.tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = tripTitle
    addButton.createFloatingActionButton()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    updateTableViewWithTripData()
    
    sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: "headerCell")?.contentView.bounds.height ?? 0
  }
  
  @IBAction func back(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func addAction(_ sender: AppUIButton) {
    let alert = UIAlertController(title: "Which would you like to add?", message: nil, preferredStyle: .actionSheet)
    let dayAction = UIAlertAction(title: "Day", style: .default, handler: handleAddDay)
    let activityAction = UIAlertAction(title: "Activity", style: .default) { (action) in
      print("Add new activity")
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    alert.addAction(dayAction)
    alert.addAction(activityAction)
    alert.addAction(cancelAction)
    alert.view.tintColor = Theme.accent
    
    present(alert, animated: true)
    
  }
  
  func handleAddDay(action: UIAlertAction) {
    let vc = AddDayViewController.getInstance() as! AddDayViewController
    vc.tripIndex = Data.tripModels.firstIndex(where: { (tripModel) -> Bool in
      tripModel.id == tripId
    })
    vc.doneSaving = { [weak self] dayModel in
      guard let self = self else { return }
      
      let indexArray = [self.tripModel?.dayModels.count ?? 0]
      self.tripModel?.dayModels.append(dayModel)
      self.tableView.insertSections(IndexSet(indexArray), with: UITableView.RowAnimation.automatic)
      
    }
    present(vc, animated: true)
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
    let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActivityTableViewCell
    
    cell.setup(model: model!)

    return cell
  }


}

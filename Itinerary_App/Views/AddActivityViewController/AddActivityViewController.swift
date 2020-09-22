//
//  AddActivityViewController.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 9/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dayPickerView: UIPickerView!
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var subtitleTextField: UITextField!
  @IBOutlet var activityTypeButtons: [UIButton]!
  
  var doneSaving: ((Int, ActivityModel) -> ())?
  var tripIndex: Int! //Needed for saving
  var tripModel: TripModel! //Needed for showing days in picker view
  
    override func viewDidLoad() {
        super.viewDidLoad()

      titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
      
      dayPickerView.dataSource = self
      dayPickerView.delegate = self
    }
  
  @IBAction func activityTypeSelected(_ sender: UIButton) {
    activityTypeButtons.forEach({ $0.tintColor = Theme.accent })
    sender.tintColor = Theme.tint
  }
  
    
  @IBAction func save(_ sender: UIButton) {
    guard titleTextField.hasValue, let newTitle = titleTextField.text else { return }
    let activityType: ActivityType = getSelectedActivityType()
    
    let dayIndex = dayPickerView.selectedRow(inComponent: 0)
    let activityModel = ActivityModel(title: newTitle, subTitle: subtitleTextField.text ?? " ", activityType: activityType)
    
    ActivityFunctions.createActivity(at: tripIndex, for: dayIndex, using: activityModel)
    
    if let doneSaving = doneSaving {
      doneSaving(dayIndex, activityModel)
    }
    
    dismiss(animated: true)
  }
  
  func getSelectedActivityType() -> ActivityType {
    for (index, button) in activityTypeButtons.enumerated() {
      if button.tintColor == Theme.tint {
        return ActivityType(rawValue: index) ?? .excursion
      }
    }
    return .excursion
  }
  
  
  @IBAction func cancel(_ sender: UIButton) {
    
    dismiss(animated: true)
  }
  
}

extension AddActivityViewController: UIPickerViewDataSource, UIPickerViewDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return tripModel.dayModels.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return tripModel.dayModels[row].title.mediumDate()
  }
  
  
}

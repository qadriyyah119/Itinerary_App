//
//  AddDayViewController.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/23/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class AddDayViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: ((DayModel) -> ())?
    var tripIndex: Int!
    var tripModel: TripModel!
    
      override func viewDidLoad() {
          super.viewDidLoad()
          
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
      }
    
    @IBAction func cancel(_ sender: UIButton) {
      dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
      if alreadyExists(datePicker.date) {
        let alert = UIAlertController(title: "Day Already Exists", message: "Choose another date", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
        return
      }
 
      let dayModel = DayModel(title: datePicker.date, subtitle: subtitleTextField.text ?? "", data: nil)
      DayFunctions.createDay(at: tripIndex, using: dayModel)
      
      if let doneSaving = doneSaving {
        doneSaving(dayModel)
      }
      dismiss(animated: true)
    }
  
  func alreadyExists(_ date: Date) -> Bool {
    if tripModel.dayModels.contains(where: { $0.title.mediumDate() == date.mediumDate() }) {
      return true
    }
    
    return false
  }

  @IBAction func done(_ sender: UITextField) {
    sender.resignFirstResponder()
  }
  
}

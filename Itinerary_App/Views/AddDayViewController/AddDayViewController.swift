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
    
      override func viewDidLoad() {
          super.viewDidLoad()
          
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
      }
    
    @IBAction func cancel(_ sender: UIButton) {
      dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
 
//      guard titleTextField.hasValue, let newTitle = titleTextField.text else
//      { return }
      
      let dayModel = DayModel(title: datePicker.date, subtitle: subtitleTextField.text ?? "", data: nil)
      DayFunctions.createDays(at: tripIndex, using: dayModel)
      
      if let doneSaving = doneSaving {
        doneSaving(dayModel)
      }
      dismiss(animated: true)
    }

  @IBAction func done(_ sender: UITextField) {
    sender.resignFirstResponder()
  }
  
}

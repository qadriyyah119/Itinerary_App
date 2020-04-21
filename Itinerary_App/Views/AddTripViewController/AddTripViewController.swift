//
//  AddTripViewController.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tripTextField: UITextField!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var saveButton: UIButton!
  
  var doneSaving: (() -> ())?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
      titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
  
  @IBAction func cancel(_ sender: UIButton) {
    dismiss(animated: true)
  }
  
  @IBAction func save(_ sender: UIButton) {
    tripTextField.rightViewMode = .never
    
    guard tripTextField.text != "", let newTripName = tripTextField.text else {
      tripTextField.layer.borderColor = UIColor.red.cgColor
      tripTextField.layer.borderWidth = 1
      tripTextField.layer.cornerRadius = 5
      tripTextField.placeholder = "Required Field"
      
      tripTextField.rightViewMode = .always
      return
    }
    TripFunctions.createTrip(tripModel: TripModel(title: newTripName))
    
    if let doneSaving = doneSaving {
      doneSaving()
    }
    dismiss(animated: true)
  }
  
}

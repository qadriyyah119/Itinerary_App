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
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    var tripIndexToEdit: Int?
    
      override func viewDidLoad() {
          super.viewDidLoad()
          
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
        //Dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
      }
    
    @IBAction func cancel(_ sender: UIButton) {
      dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
      titleTextField.rightViewMode = .never
      
      guard titleTextField.text != "", let newTripName = titleTextField.text else {
        titleTextField.layer.borderColor = UIColor.red.cgColor
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.cornerRadius = 5
        titleTextField.placeholder = "Required Field"
        
        titleTextField.rightViewMode = .always
        return
      }
//      if let index = tripIndexToEdit {
//        TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
//      } else {
//        TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
//      }
      if let doneSaving = doneSaving {
        doneSaving()
      }
      dismiss(animated: true)
    }

}

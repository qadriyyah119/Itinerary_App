//
//  AddTripViewController.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Photos
import UIKit

class AddTripViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tripTextField: UITextField!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var imageView: UIImageView!
  
  var doneSaving: (() -> ())?
  var tripIndexToEdit: Int?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
      titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
      imageView.layer.cornerRadius = 10
      
      //Dropshadow on title
      titleLabel.layer.shadowOpacity = 1
      titleLabel.layer.shadowColor = UIColor.white.cgColor
      titleLabel.layer.shadowOffset = CGSize.zero
      titleLabel.layer.shadowRadius = 5
      
      
      if let index = tripIndexToEdit {
        let trip = Data.tripModels[index]
        tripTextField.text = trip.title
        imageView.image = trip.image
      }
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
    if let index = tripIndexToEdit {
      TripFunctions.updateTrip(at: index, title: newTripName)
    } else {
      TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
    }
    if let doneSaving = doneSaving {
      doneSaving()
    }
    dismiss(animated: true)
  }
  
  fileprivate func presentPhotoPickerController() {
    DispatchQueue.main.async {
      let myPickerController = UIImagePickerController()
      myPickerController.delegate = self
      myPickerController.sourceType = .photoLibrary
      self.present(myPickerController, animated: true)
    }
  }
  
  @IBAction func addPhoto(_ sender: UIButton) {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      PHPhotoLibrary.requestAuthorization { (status) in
        switch status {
        case .authorized:
          self.presentPhotoPickerController()
        case .notDetermined:
          if status == PHAuthorizationStatus.authorized {
            self.presentPhotoPickerController()
          }
        case .restricted:
          let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library access is restricted and cannot be accessed.", preferredStyle: .alert)
          let okAction = UIAlertAction(title: "Ok", style: .default)
          alert.addAction(okAction)
          self.present(alert, animated: true)
        case .denied:
          DispatchQueue.main.async {
          let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library access was previously denied. Please update your Settings if you with to change this.", preferredStyle: .alert)
          let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
            
              let url = URL(string: UIApplication.openSettingsURLString)!
              UIApplication.shared.open(url, options: [:])
            }
            alert.addAction(goToSettingsAction)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true)
          }
          //let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

//          alert.addAction(goToSettingsAction)
//          alert.addAction(cancelAction)
//        @unknown default:
//          break
        default:
          break
        }
      }
    }
  }
}



extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      self.imageView.image = image
    }
    
    dismiss(animated: true)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true)
  }
}

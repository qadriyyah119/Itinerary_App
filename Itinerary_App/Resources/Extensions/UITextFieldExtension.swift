//
//  UITextFieldExtension.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/23/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

extension UITextField {
  var hasValue: Bool {
    guard text == "" else { return true }

    layer.borderColor = UIColor.red.cgColor
    layer.borderWidth = 1
    layer.cornerRadius = 5
    placeholder = "Required Field"

    rightViewMode = .unlessEditing
    
    return false
  }
}

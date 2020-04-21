//
//  UIButtonExtension.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

extension UIButton {

  func createFloatingActionButton() {
    backgroundColor = Theme.tint
    layer.cornerRadius = frame.height / 2
    layer.shadowOpacity = 0.25
    layer.shadowRadius = 5
    layer.shadowOffset = CGSize(width: 0, height: 10)
  }

}

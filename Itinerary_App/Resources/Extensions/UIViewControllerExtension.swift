//
//  UIViewControllerExtension.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/23/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

extension UIViewController {
  
  /**
    Just returns the initial view controller on a storyboard
   */
  static func getInstance() -> UIViewController {
    let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
    return storyboard.instantiateInitialViewController()!
  }
  
}

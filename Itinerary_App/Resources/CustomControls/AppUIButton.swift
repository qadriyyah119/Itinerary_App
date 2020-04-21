//
//  AppUIButton.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    backgroundColor = Theme.tint
    layer.cornerRadius = frame.height / 2
    setTitleColor(UIColor.white, for: .normal)
  }

}

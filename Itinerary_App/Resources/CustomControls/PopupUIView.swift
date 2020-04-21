//
//  PopupUIView.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class PopupUIView: UIView {
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    layer.shadowOpacity = 1
    layer.shadowOffset = CGSize.zero
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.cornerRadius = 10
    
    backgroundColor = Theme.background
  }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

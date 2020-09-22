//
//  HeaderTableViewCell.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
      subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }

  func setup(model: DayModel) {
    titleLabel.text = model.title.mediumDate()
    subtitleLabel.text = model.subtitle
  }
}

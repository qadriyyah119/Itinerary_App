//
//  TripsTableViewCell.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      cardView.addShadowAndRoundedCorners()
      titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
      cardView.backgroundColor = Theme.accent

    }
  
  func setup(tripModel: TripModel) {
    titleLabel.text = tripModel.title
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

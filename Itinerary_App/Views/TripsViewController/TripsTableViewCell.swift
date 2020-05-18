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
  @IBOutlet weak var tripImageView: UIImageView!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      cardView.addShadowAndRoundedCorners()
      titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
      cardView.backgroundColor = Theme.accent
      tripImageView.layer.cornerRadius = cardView.layer.cornerRadius

    }
  
  func setup(tripModel: TripModel) {
    titleLabel.text = tripModel.title
    
    //sets a slight animation to the image when it loads
    if let tripImage = tripModel.image {
      tripImageView.alpha = 0.3
      tripImageView.image = tripImage
      
      UIView.animate(withDuration: 1) {
        self.tripImageView.alpha = 1
      }
    }
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TripModel.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/20/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class TripModel {
  let id: UUID
  var title: String
  var image: UIImage?
  
  init(title:String, image: UIImage? = nil) {
    id = UUID()
    self.title = title
    self.image = image
  }
}

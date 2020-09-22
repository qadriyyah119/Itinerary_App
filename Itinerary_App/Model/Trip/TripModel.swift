//
//  TripModel.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/20/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

struct TripModel {
  let id: UUID
  var title: String
  var image: UIImage?
  var dayModels = [DayModel]() {
    didSet {
      // Called when a new value is assigned to dayModels
      //dayModels = dayModels.sorted(by: { $0.title < $1.title })
      
      dayModels = dayModels.sorted(by: <)
    }
  }
  
  init(title:String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
    id = UUID()
    self.title = title
    self.image = image
    
    if let dayModels = dayModels {
      self.dayModels = dayModels
    }
  }
}

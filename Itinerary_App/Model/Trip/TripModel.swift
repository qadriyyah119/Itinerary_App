//
//  TripModel.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/20/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation

class TripModel {
  let id: UUID
  var title: String
  
  init(title:String) {
    id = UUID()
    self.title = title
  }
}

//
//  TripModel.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/20/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation

class TripModel {
  var id: String!
  var title: String!
  
  init(title:String) {
    id = UUID().uuidString
    self.title = title
  }
}

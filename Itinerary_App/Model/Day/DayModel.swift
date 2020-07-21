//
//  DayModel.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/16/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation

struct DayModel {
  var id: String!
  var title = ""
  var subtitle = ""
  var activityModels = [ActivityModel]()
  
  init(title: String, subtitle: String, data: [ActivityModel]?) {
    id = UUID().uuidString
    self.title = title
    self.subtitle = subtitle
    
    if let data = data {
      self.activityModels = data
    }
  }
}

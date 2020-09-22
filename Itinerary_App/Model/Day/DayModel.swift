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
  var title = Date()
  var subtitle = ""
  var activityModels = [ActivityModel]()
  
  init(title: Date, subtitle: String, data: [ActivityModel]?) {
    id = UUID().uuidString
    self.title = title
    self.subtitle = subtitle
    
    if let data = data {
      self.activityModels = data
    }
  }
}

// another way to sort the dates on DatePicker. Used on TripModel in didSet observer
extension DayModel: Comparable {
  static func < (lhs: DayModel, rhs: DayModel) -> Bool {
    return lhs.title < rhs.title
  }
  
  static func == (lhs: DayModel, rhs: DayModel) -> Bool {
    return lhs.id == rhs.id
  }
}

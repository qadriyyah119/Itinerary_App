//
//  ActivityModel.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/16/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation
import UIKit

struct ActivityModel {
  var id: String!
  var title = ""
  var subTitle = ""
  var activityType: ActivityType
  var photo: UIImage?
  
  init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil) {
    id = UUID().uuidString
    self.title = title
    self.subTitle = subTitle
    self.activityType = activityType
    self.photo = photo
  }
}

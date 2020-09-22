//
//  ActivityFunctions.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 9/21/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation

class ActivityFunctions {
  static func createActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel) {
    // Replace with real data store code
    
    Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.append(activityModel)
  }
}

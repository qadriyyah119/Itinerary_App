//
//  DayFunctions.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/23/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation

class DayFunctions {
  static func createDays(at tripIndex: Int, using dayModel: DayModel) {
    // Replace with real data store code
    
    Data.tripModels[tripIndex].dayModels.append(dayModel)
  }
}

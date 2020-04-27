//
//  TripFunctions.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/20/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation

class TripFunctions {
  static func createTrip(tripModel: TripModel) {
    Data.tripModels.append(tripModel)
  }
  
  static func readTrips(completion: @escaping () -> ()) {
    // 1. this code will get called on a background thread and once all the data is retrieved the below completion function will get called
    DispatchQueue.global(qos: .userInteractive).async {
      if Data.tripModels.count == 0 {
        Data.tripModels.append(TripModel(title: "Trip to Bali!"))
        Data.tripModels.append(TripModel(title: "Mexico"))
        Data.tripModels.append(TripModel(title: "Russian Trip"))
      }
      // 2. completion function. We know we have all the data once this is called
      DispatchQueue.main.async {
           completion()
         }
    }
   
    
  }
  
  static func updateTrip(tripModel: TripModel) {
    
  }
  
  static func deleteTrip(index: Int) {
    Data.tripModels.remove(at: index)
  }
}

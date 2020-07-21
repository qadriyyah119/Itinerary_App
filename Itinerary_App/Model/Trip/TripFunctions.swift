//
//  TripFunctions.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 4/20/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class TripFunctions {
  static func createTrip(tripModel: TripModel) {
    Data.tripModels.append(tripModel)
  }
  
  static func readTrips(completion: @escaping () -> ()) {
    
    DispatchQueue.global(qos: .userInitiated).async {
      if Data.tripModels.count == 0 {
        Data.tripModels = MockData.createMockTripModelData()
      }
      // 2. completion function. We know we have all the data once this is called
      DispatchQueue.main.async {
           completion()
         }
    }
  }
  static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()) {
    
    DispatchQueue.global(qos: .userInitiated).async {
      let trip = Data.tripModels.first(where: { $0.id == id })
      
      DispatchQueue.main.async {
        completion(trip)
      }
    }
  }
  
  static func updateTrip(at index: Int, title: String, image: UIImage?) {
    Data.tripModels[index].title = title
    Data.tripModels[index].image = image
    
  }
  
  static func deleteTrip(index: Int) {
    Data.tripModels.remove(at: index)
  }
}

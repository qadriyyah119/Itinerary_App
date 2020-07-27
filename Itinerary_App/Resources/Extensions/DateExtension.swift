//
//  DateExtension.swift
//  Itinerary_App
//
//  Created by Qadriyyah Griffin on 7/27/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import Foundation

extension Date {
  func add(days: Int) -> Date {
    return Calendar.current.date(byAdding: .day, value: days, to: Date())!
  }
}

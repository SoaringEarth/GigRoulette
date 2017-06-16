//
//  EntityStuff.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct GenreEntity {
    let name: String
    let id: String
}

struct EventEntity {
    let name: String
    let id: String
    let url: String
    let genres: [GenreEntity]
    let distanceFromUser: Double
    let eventLocation: Point
    let ticketPrice: Double
//    let dates: [EventDate]
}

struct EventDate {
    let startTime: StartTime
    let startDate: StartDate
}

struct StartTime {
    let localTime: String
}

struct StartDate {
    let localDate: String
}

struct VenueEntity {
    let name: String
    let addressLine1: String
    let city: String
    let country: Country
    let distanceFromUser: Decimal
}

struct Country {
    let code: String
    let name: String
}

enum DistanceUnit: String {
    case km = "km"
    case miles = "miles"
}

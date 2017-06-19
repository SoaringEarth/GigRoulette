//
//  EntityStuff.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

struct GenreEntity {
    let name: String
    let id: String
}

extension GenreEntity: Equatable {}

func ==(lhs: GenreEntity, rhs: GenreEntity) -> Bool {
    let areEqual = lhs.id == rhs.id &&
        lhs.name == rhs.name
    return areEqual
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

// TFL Entities

struct Journey {
    var legs: [Leg] = [Leg]()
    let startDateTime: Date
    let arrivalDateTime: Date
    let durationMinutes: Int
    
    init(durationMinutes: Int) {
        self.startDateTime = Date()
        let calendar = Calendar.current
        self.arrivalDateTime = calendar.date(byAdding: .minute, value: durationMinutes, to: startDateTime)!
        self.durationMinutes = durationMinutes
    }
}

struct Leg {
    let duration: Int
    let description: String
    
    init(duration: Int, description: String) {
        self.duration = duration
        self.description = description
    }
}

struct Point {
    let lat: String
    let lon: String
    
    init(lat: String, lon: String) {
        self.lat = lat
        self.lon = lon
    }
}



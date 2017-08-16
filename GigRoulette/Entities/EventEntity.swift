//
//  EventEntity.swift
//  GigRoulette
//
//  Created by apple on 19/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

struct EventEntity {
    let name: String
    let id: String
    let url: String
    let genres: [GenreEntity]
    let distanceFromUser: Double
    let eventLocation: Point
    let eventVenue: VenueEntity
    let ticketPrices: [Double]
    let eventImageURLS: [String]
//    let dates: [EventDate]
}

extension EventEntity: Equatable {}

func ==(lhs: EventEntity, rhs: EventEntity) -> Bool {
    let areEqual = lhs.id == rhs.id &&
        lhs.name == rhs.name
    return areEqual
}

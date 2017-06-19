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
    let ticketPrice: Double
    //    let dates: [EventDate]
}

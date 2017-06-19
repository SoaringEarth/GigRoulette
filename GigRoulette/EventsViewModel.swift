//
//  EventsViewModel.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class EventsViewModel {
    
    let eventsModel = EventsModel.sharedInstance
    
    func getEvents() -> [EventEntity] {
        return eventsModel.events
    }
    
    func getGenres() -> [GenreEntity] {
        return eventsModel.getGenresFromEvents()
    }
    
    func getRandomEvent() -> EventEntity {
        
        return eventsModel.events[0]
    }
}

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
        
        // Stub Data
        let testGenres = [GenreEntity(name: "Art Show", id: "1"),
                          GenreEntity(name: "Theatre", id: "2"),
                          GenreEntity(name: "Live Music", id: "3"),
                          GenreEntity(name: "Sports", id: "4"),
                          GenreEntity(name: "Interactive Experience", id: "5"),
                          GenreEntity(name: "Performance", id: "6")]
        return testGenres
//        return eventsModel.getGenresFromEvents()
    }
    
    func getRandomEvent() -> EventEntity {
        
        return eventsModel.events[0]
    }
}

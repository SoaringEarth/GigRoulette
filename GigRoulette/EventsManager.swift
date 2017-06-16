//
//  EventsManager.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class EventsManager {
    
    let eventsModel: EventsModel
    
    init(WithGeoHash geoHash: String, AndCountryCode countryCode: String) {
        eventsModel = EventsModel(WithGeoHash: geoHash, AndCountryCode: countryCode)
    }
    
    var events: [EventEntity]? = []
    var genres: [GenreEntity]? = []
    
    func getEvents() {
        events = eventsModel.events
    }
    
    func getRandomEvent() -> EventEntity {
        
        return events![0]
        
    }
    
    private func getGenres(FromEvents: [EventEntity]) {
        
        
        
    }
}

//
//  EventsManager.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class EventsManager {
    
    static let sharedInstance = EventsManager()
    
    let eventsModel = EventsModel.sharedInstance
    var events: [EventEntity]
    
    init() {
        self.events = eventsModel.events
    }
    
    func getEvents() -> [EventEntity] {
        return self.events
    }
    
    func getRandomEvent() -> EventEntity {
        
        return events[0]
        
    }
}

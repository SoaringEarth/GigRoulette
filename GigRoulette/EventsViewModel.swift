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
    
    func getRandomEvent() -> EventEntity {
        
        return eventsModel.events[0]
    }
}

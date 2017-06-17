//
//  EventsModel.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import CoreLocation

class EventsModel {
    
    static let sharedInstance = EventsModel()
    
    var events: [EventEntity] = []
    
    init() {
        initEvents()
    }
    
    fileprivate func initEvents() {
        if let location = LocationTracker.sharedInstance.currentLocation {
            GeoHashAPIHandler.getCountryCode(FromLocation: location, withSuccess: { (countryCode) in
                GeoHashAPIHandler.getGeoHash(ForLocation: location, WithSuccess: { (geoHash) in
                    self.getAllEvents(WithGeoHash: geoHash, AndCountryCode: countryCode, WithSuccess: { (events) in
                        self.events = events
                    })
                })
            })
        }
    }
    
    func getAllEvents(WithGeoHash geoHash: String, AndCountryCode countryCode: String, WithSuccess success: @escaping ([EventEntity])->()) {
        TMAPIHandler.getEvents(WithGeoHash: geoHash, AndCountryCode: countryCode) { (events) in
            success(events)
        }
    }
    
    func getRandomEvent() -> EventEntity {
        return events[0]
    }
}

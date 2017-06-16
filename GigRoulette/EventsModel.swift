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
    
    var events: [EventEntity]?
    
    init() {
    }
    
    init(WithGeoHash geoHash: String, AndCountryCode countryCode: String) {
        getAllEvents(WithGeoHash: geoHash, AndCountryCode: countryCode)
    }
    
    func getAllEvents(WithGeoHash geoHash: String, AndCountryCode countryCode: String) {
        self.events = []
        let urlRequest = URLRequest(url: URL(string:"https://app.ticketmaster.com/discovery/v2/events.json?geoPoint=\(geoHash)&radius=20&size=100&unit=km&countryCode=\(countryCode)&apikey=p2qmN2j6HxHbR3IG8ErzSHV2fJ6Jsz3w")!)
        
        let defaultSession: URLSession = URLSession(configuration: .default)
        defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
            if responseError != nil {
                print("failed")
            } else {
                do {
                    let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                    if let embeddedData = serializedData["_embedded"] {
                        if let eventData = embeddedData["events"] {
                            for event in eventData as! [AnyObject] {
                                let eventName = event["name"] as! String
                                let eventID = event["id"] as! String
                                let eventURL = event["url"] as! String
                                
                                var genreArray:[GenreEntity] = []
                                for genre in (event["classifications"] as! [AnyObject]) {
                                    let eventGenreName = (genre["genre"] as! [String : AnyObject])["name"] as! String
                                    let eventGenreID = (genre["genre"] as! [String : AnyObject])["id"] as! String
                                    let newGenre = GenreEntity(name: eventGenreName, id: eventGenreID)
                                    genreArray.append(newGenre)
                                }
                                
                                
                                // Filter based on ticket sale status
                                
                                // get distance from user
                                
                                let newEvent = EventEntity(name: eventName, id: eventID, url: eventURL, genres: genreArray)
                                self.events!.append(newEvent)
                            }
                            print(self.events!.count)
                        }
                    } else {
                        print("No Events")
                    }
                } catch {
                    print("Failed to serialize responseData to [String : AnyObject]")
                }
            }
        }.resume()
    }

}

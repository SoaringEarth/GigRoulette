//
//  EventEntityParser.swift
//  GigRoulette
//
//  Created by apple on 25/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

func create(EventsWithDictionary dictionary: [String : AnyObject]) -> [EventEntity] {
    var events: [EventEntity] = []
    if let embeddedData = dictionary["_embedded"] {
        if let eventData = embeddedData["events"] {
            for event in eventData as! [AnyObject] {
                
                if ((event["dates"] as! [String : AnyObject])["status"] as! [String : AnyObject])["code"] as! String == "onsale" {
                    let eventName = event["name"] as! String
                    let eventID = event["id"] as! String
                    let eventURL = event["url"] as! String
                    
                    var genreArray:[GenreEntity] = []
                    
                    if let classifications = event["classifications"] as? [AnyObject] {
                        for genre in classifications {
                            let eventGenreName = (genre["genre"] as! [String : AnyObject])["name"] as! String
                            let eventGenreID = (genre["genre"] as! [String : AnyObject])["id"] as! String
                            let newGenre = GenreEntity(name: eventGenreName, id: eventGenreID)
                            genreArray.append(newGenre)
                        }
                    }
                    
                    let eventLat: String = (((((event["_embedded"] as! [String : AnyObject])["venues"] as! [AnyObject]).first as! [String : AnyObject])["location"] as! [String : AnyObject])["latitude"] as! String)
                    let eventLon: String = (((((event["_embedded"] as! [String : AnyObject])["venues"] as! [AnyObject]).first as! [String : AnyObject])["location"] as! [String : AnyObject])["longitude"] as! String)
                    let eventLocation = Point(lat: eventLat, lon: eventLon)
                    
                    let venueName: String = (((event["_embedded"] as! [String : AnyObject])["venues"] as! [AnyObject]).first as! [String : AnyObject])["name"] as! String
                    let venueAddress1: String = ((((event["_embedded"] as! [String : AnyObject])["venues"] as! [AnyObject]).first as! [String : AnyObject])["address"] as! [String : AnyObject]).first?.value as! String
                    let venueCity: String = ((((event["_embedded"] as! [String : AnyObject])["venues"] as! [AnyObject]).first as! [String : AnyObject])["city"] as! [String : AnyObject]).first?.value as! String
                    let venueCountry: String = ((((event["_embedded"] as! [String : AnyObject])["venues"] as! [AnyObject]).first as! [String : AnyObject])["country"] as! [String : AnyObject])["name"] as! String
                    let venueDistanceFromUser: NSNumber = (((event["_embedded"] as! [String : AnyObject])["venues"] as! [AnyObject]).first as! [String : AnyObject])["distance"] as! NSNumber
                    
                    let eventVenue = VenueEntity(name: venueName,
                                                 addressLine1: venueAddress1,
                                                 city: venueCity,
                                                 country: venueCountry,
                                                 distanceFromUser: venueDistanceFromUser.decimalValue)
                    
                    let eventDistanceFromUser = (event["distance"] as! Double).roundTo(places: 2)
                    
                    let eventTicketPrice = [Double(arc4random_uniform(100) + 16)]
                    
                    let newEvent = EventEntity(name: eventName, id: eventID, url: eventURL, genres: genreArray, distanceFromUser: eventDistanceFromUser, eventLocation: eventLocation, eventVenue: eventVenue, ticketPrices: eventTicketPrice)
                    events.append(newEvent)
                }
            }
            print(events.count)
        }
    } else {
        print("No Events")
    }
    
    return events
}

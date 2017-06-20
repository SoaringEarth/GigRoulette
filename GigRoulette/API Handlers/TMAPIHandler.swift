//
//  TMAPIHandler.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class TMAPIHandler {
    static func getEvents(WithGeoHash geoHash: String, AndCountryCode countryCode: String, WithSuccess success: @escaping ([EventEntity])->()) {
        let urlRequest = URLRequest(url: URL(string:"https://app.ticketmaster.com/discovery/v2/events.json?geoPoint=\(geoHash)&radius=20&size=100&unit=km&countryCode=\(countryCode)&apikey=p2qmN2j6HxHbR3IG8ErzSHV2fJ6Jsz3w")!)
        
        let defaultSession: URLSession = URLSession(configuration: .default)
        defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
            if responseError != nil {
                print("failed")
            } else {
                do {
                    let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                    var events: [EventEntity] = []
                    if let embeddedData = serializedData["_embedded"] {
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
                                    
                                    let eventDistanceFromUser = (event["distance"] as! Double).roundTo(places: 2)
                                    
                                    let eventTicketPrice = Double(arc4random_uniform(100) + 16)
                                    
                                    
                                    let newEvent = EventEntity(name: eventName, id: eventID, url: eventURL, genres: genreArray, distanceFromUser: eventDistanceFromUser, eventLocation: eventLocation, ticketPrice: eventTicketPrice)
                                    events.append(newEvent)
                                }
                            }
//                            getPrice(ForEvent: self.events!.first!, WithSuccess: { (priceString) in
//                                print(priceString)
//                            })
                            print(events.count)
                            success(events)
                            NotificationCenter.default.post(name: NotificationName.eventsReceived.realName, object: nil)
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


//
//  APIStuff.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

// locale for retrieving maximum events
func getTMEvents(NearGeoHash geoHash: String, InRadius radius: Int, withDistanceUnit unit: DistanceUnit, WithSuccess success: @escaping ([EventEntity])->()) {
    let urlRequest = URLRequest(url: URL(string:"https://app.ticketmaster.com/discovery/v2/events.json?geoPoint=\(geoHash)&radius=\(radius)&unit=\(unit.rawValue)&apikey=p2qmN2j6HxHbR3IG8ErzSHV2fJ6Jsz3w")!)
    
    let defaultSession: URLSession = URLSession(configuration: .default)
    defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
        if responseError != nil {
            print("failed")
        } else {
            do {
                let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                if let embeddedData = serializedData["_embedded"] {
                    if let eventData = embeddedData["events"] {
                        var eventArray: [EventEntity] = []
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
                            
                            let newEvent = EventEntity(name: eventName, id: eventID, url: eventURL, genres: genreArray)
                            eventArray.append(newEvent)
                        }
                        print(eventArray.count)
                        
                        success(eventArray)
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

func getTMVenues() {
    var urlRequest = URLRequest(url: URL(string:"https://app.ticketmaster.com/discovery/v2/venues.json?countryCode=GB&apikey=p2qmN2j6HxHbR3IG8ErzSHV2fJ6Jsz3w")!)
    urlRequest.cachePolicy = .reloadIgnoringCacheData
    let defaultSession: URLSession = URLSession(configuration: .default)
    defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
        if responseError != nil {
            print("failed")
        } else {
            do {
                let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                if let embeddedData = serializedData["_embedded"] {
                    if let venueData = embeddedData["venues"] {
                        for venue in venueData as! [AnyObject] {
                            print(venue)
                        }
                    }
                }
            } catch {
                print("Failed to serialize responseData to [String : AnyObject]")
            }
        }
        }.resume()
}

func getTicketMasterAttractions() {
    var urlRequest = URLRequest(url: URL(string:"https://app.ticketmaster.com/discovery/v2/attractions.json?apikey=p2qmN2j6HxHbR3IG8ErzSHV2fJ6Jsz3w")!)
    urlRequest.cachePolicy = .reloadIgnoringCacheData
    
    let defaultSession: URLSession = URLSession(configuration: .default)
    defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
        if responseError != nil {
            print("failed")
        } else {
            do {
                let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                if let embeddedData = serializedData["_embedded"] {
                    if let attractionData = embeddedData["attractions"] {
                        for attraction in attractionData as! [AnyObject] {
                            print(attraction)
                        }
                    }
                }
            } catch {
                print("Failed to serialize responseData to [String : AnyObject]")
            }
        }
    }.resume()
}



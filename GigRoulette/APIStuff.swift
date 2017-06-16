////
////  APIStuff.swift
////  GigRoulette
////
////  Created by apple on 16/06/2017.
////  Copyright © 2017 apple. All rights reserved.
////
//
//import Foundation
//
//// locale for retrieving maximum events
//func getTMEvents(NearGeoHash geoHash: String, InRadius radius: Int, withDistanceUnit unit: DistanceUnit, WithSuccess success: @escaping ([EventEntity])->()) {
//    let urlRequest = URLRequest(url: URL(string:"https://app.ticketmaster.com/discovery/v2/events.json?geoPoint=\(geoHash)&radius=\(radius)&unit=\(unit.rawValue)&apikey=p2qmN2j6HxHbR3IG8ErzSHV2fJ6Jsz3w")!)
//    var events: [EventEntity] = []
//    let defaultSession: URLSession = URLSession(configuration: .default)
//    defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
//        if responseError != nil {
//            print("failed")
//        } else {
//            do {
//                let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
//                if let embeddedData = serializedData["_embedded"] {
//                    if let eventData = embeddedData["events"] {
//                        for event in eventData as! [AnyObject] {
//
//                            if ((event["dates"] as! [String : AnyObject])["status"] as! [String : AnyObject])["code"] as! String == "onsale" {
//                                let eventName = event["name"] as! String
//                                let eventID = event["id"] as! String
//                                let eventURL = event["url"] as! String
//
//                                var genreArray:[GenreEntity] = []
//                                for genre in (event["classifications"] as! [AnyObject]) {
//                                    let eventGenreName = (genre["genre"] as! [String : AnyObject])["name"] as! String
//                                    let eventGenreID = (genre["genre"] as! [String : AnyObject])["id"] as! String
//                                    let newGenre = GenreEntity(name: eventGenreName, id: eventGenreID)
//                                    genreArray.append(newGenre)
//                                }
//
//
//                                let eventDistanceFromUser = (event["distance"] as! Double).roundTo(places: 2)
//                                // get distance from user
//
//                                let newEvent = EventEntity(name: eventName, id: eventID, url: eventURL, genres: genreArray, distanceFromUser: eventDistanceFromUser)
//                                events.append(newEvent)
//                            }
//                        }
//                        print(events.count)
//                    }
//                } else {
//                    print("No Events")
//                }
//            } catch {
//                print("Failed to serialize responseData to [String : AnyObject]")
//            }
//        }
//    }.resume()
//}
//
//
//
//
//
//
//


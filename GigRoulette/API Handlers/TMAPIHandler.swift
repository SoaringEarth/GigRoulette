//
//  TMAPIHandler.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class TMAPIHandler {
    static func getEvents(WithGeoHash geoHash: String, AndCountryCode countryCode: String, WithSuccess success: @escaping ([EventEntity])->(), WithFailure failure: @escaping ()->()) {
        let urlRequest = URLRequest(url: URL(string:"https://app.ticketmaster.com/discovery/v2/events.json?geoPoint=\(geoHash)&radius=20&size=100&unit=km&countryCode=\(countryCode)&apikey=p2qmN2j6HxHbR3IG8ErzSHV2fJ6Jsz3w")!)
        
        let defaultSession: URLSession = URLSession(configuration: .default)
        defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
            if responseError != nil {
                print("failed")
                failure()
            } else {
                do {
                    let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                    let events: [EventEntity] = create(EventsWithDictionary: serializedData)
                    print(events.count)
                    success(events)
                    NotificationCenter.default.post(name: NotificationName.eventsReceived.realName, object: nil)
                } catch {
                    print("Failed to serialize responseData to [String : AnyObject]")
                }
            }
            }.resume()
    }
}


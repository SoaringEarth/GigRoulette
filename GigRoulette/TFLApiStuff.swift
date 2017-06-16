//
//  TFLApiStuff.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
// 2af9a281d929bcb15d3f0838ee372f2a

struct Journey {
    let legs: [Leg]
    let startDateTime: Date
    let arrivalDateTime: Date
}

struct Leg {
    let duration: Int
    let description: String
}

struct Point {
    let lat: String
    let lon: String
    
    init(lat: String, lon: String) {
        self.lat = lat
        self.lon = lon
    }
}

func getDirections(FromStartPoint startPoint: Point, ToEndPoint endPoint: Point) {
    //https://api.tfl.gov.uk/Journey/JourneyResults/51.5412969%2C-0.0954148/to/51.5388457%2C-0.1367267
    
    let urlRequest = URLRequest(url: URL(string:"https://api.tfl.gov.uk/Journey/JourneyResults/\(startPoint.lat)%2C\(startPoint.lon)/to/\(endPoint.lat)%2C\(endPoint.lon)")!)
    
    let defaultSession: URLSession = URLSession(configuration: .default)
    defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
        if responseError != nil {
            print("failed")
        } else {
            do {
                let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                                
                guard let journeys = serializedData["journeys"] as? [[String: AnyObject]], let firstJourney = journeys.first else {
                    print("no journeys")
                    return
                }
                print(firstJourney["duration"])
                
                
            } catch {
                print("Failed to serialize responseData to [String : AnyObject]")
            }
        }
    }.resume()
}

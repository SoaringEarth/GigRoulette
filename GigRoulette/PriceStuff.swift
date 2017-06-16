//
//  PriceStuff.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

func getPrice(ForEvent event: EventEntity, WithSuccess success: @escaping (String)->()) {
    
    var urlRequest = URLRequest(url: URL(string:"https://app.ticketmaster.com/commerce/v2/events/\(event.id)/offers.json?apikey=p2qmN2j6HxHbR3IG8ErzSHV2fJ6Jsz3w")!)
    urlRequest.httpMethod = "GET"
    let defaultSession: URLSession = URLSession(configuration: .default)
    defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
        if responseError != nil {
            print("failed")
        } else {
            do {
                let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                print(serializedData)
                
                success("")
            } catch {
                print("Failed to serialize responseData to [String : AnyObject]")
            }
        }
    }.resume()
}

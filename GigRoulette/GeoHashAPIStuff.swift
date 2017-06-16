//
//  GeoHashAPIStuff.swift
//  GigRoulette
//
//  Created by apple on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

func getGeoHash(WithLat latitude: Double, AndLongitude longitude: Double, WithSuccess success: @escaping (String)->()) {
    var urlRequest = URLRequest(url: URL(string:"http://geohash.org/?q=\(latitude),\(longitude)&format=url&redirect=0")!)
    urlRequest.cachePolicy = .reloadIgnoringCacheData
    
    let defaultSession: URLSession = URLSession(configuration: .default)
    defaultSession.dataTask(with: urlRequest) { (responseData, responseURL, responseError) in
        if responseError != nil {
            print("failed")
        } else {
            if let responseData = responseData {
                if let geoHashURL = String(data: responseData, encoding: .utf8) {
                    var cleanHash = geoHashURL.replacingOccurrences(of: "http://geohash.org/", with: "")
                    while cleanHash.characters.count > 9 {
                        cleanHash.characters.removeLast()
                    }
                    success(cleanHash)
                }
            }
        }
    }.resume()
}

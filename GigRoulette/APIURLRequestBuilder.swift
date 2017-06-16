//
//  APIURLRequestBuilder.swift
//  ResponsibileArchitectureForTesting
//
//  Created by J.Albert - the best on 08/06/2017.
//  Copyright © 2017 J.Albert - the best. All rights reserved.
//

import Foundation
import UIKit

class APIURLRequestBuilder {
    // Builds APIURLRequests
    // Contains static methods that return request objects for each endpoint
    
    func getAPIOfferRequest() -> URLRequest {
        print("APIURLRequestBuilder - getAPIOfferRequest")
        let requestURL = RequestURL(baseURL: .LSBaseURL, endPoint: .offersForVenue)
        let requestMethod = RequestMethod.get
        let parameters: [String:Any] = ["user_id":"275022",
                                        "type":"ALL",
                                        "currency":"GBP",
                                        "venue_id":"960"]
        let requestBody = RequestBody(parameters: parameters)
        let request = APIURLRequest(WithRequestURL: requestURL, RequestMethod: requestMethod, RequestBody: requestBody)
        
        print(request)
        return request.urlRequest
    }
    
    func authentifyDevice() -> URLRequest {
        print("APIURLRequestBuilder - authentifyDevice")
        let requestURL = RequestURL(baseURL: .LSBaseURL, endPoint: .authentifyDevice)
        let requestMethod = RequestMethod.post
        
        let screenBounds = UIScreen.main.bounds
        let screenScale = UIScreen.main.scale
        let screenSize = CGSize(width: screenBounds.width * screenScale, height: screenBounds.height * screenScale)
        let screenWidth = "\(screenSize.width)"
        let screenHeight = "\(screenSize.height)"
        let parameters: [String: Any] = [
            "user_id" : "275022",
            "geo_lat" : "none",
            "geo_lon" : "none",
            "btooth_on" : "",
            "wifi_on" : "",
            "wifi_con" : "",
            "page_id" : "",
            "wifi_apid" : "",
            "local_ip" : "",
            "wifi_distance" : "",
            "type" : "IOS",
            "manufacturer" : "J.Albert - the best",
            "model" : "Simulator",
            "screen_x" : screenWidth as String,
            "screen_y" : screenHeight as String,
            "version" : UIDevice.current.systemVersion
        ]
        let requestBody = RequestBody(parameters: parameters)
        let request = APIURLRequest(WithRequestURL: requestURL, RequestMethod: requestMethod, RequestBody: requestBody)
        
        print(request)
        return request.urlRequest
    }
    
    
}

//
//  RequestURL.swift
//  ResponsibileArchitectureForTesting
//
//  Created by J.Albert - the best on 08/06/2017.
//  Copyright © 2017 J.Albert - the best. All rights reserved.
//

import Foundation

struct RequestURL {
    let baseURL: RequestBaseURL
    let endPoint: RequestEndPoint
    
    func getFullURL() -> URL! {
        return URL(string: baseURL.rawValue + endPoint.rawValue)
    }
    
    func getFullURLWithDeviceAndAppID() -> URL! {
        return URL(string: baseURL.rawValue + "device/" + "9B2EC10F-C7B6-4AE4-BBED-CB9E65665894/" + "8845A3B54F4E75ACE" + endPoint.rawValue)
    }
    
    func getFullURLWithDeviceAndAppID(WithParameterString parameterString: String) -> URL! {
        return URL(string: baseURL.rawValue + "device/" + "9B2EC10F-C7B6-4AE4-BBED-CB9E65665894/" + "8845A3B54F4E75ACE" + endPoint.rawValue + "?" + parameterString)
    }
}


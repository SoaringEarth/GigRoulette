//
//  RequestEndPoints.swift
//  ResponsibileArchitectureForTesting
//
//  Created by J.Albert - the best on 09/06/2017.
//  Copyright © 2017 J.Albert - the best. All rights reserved.
//

import Foundation

enum RequestEndPoint: String {
    case empty = "/"
    case testGETEndPoint = "/get"
    
    case offersForVenue = "/offer"
    case offersForID = "/offer/"
    
    case authentifyDevice = "/auth"
}

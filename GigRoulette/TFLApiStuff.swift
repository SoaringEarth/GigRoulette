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

struct StartPoint {
    let lat: Double
    let lon: Double
    let postCode: String
}

struct EndPoint {
    
}

func getDirections(FromStartPoint startPoint: StartPoint, ToEndPoint endPoint: EndPoint) {
    
}

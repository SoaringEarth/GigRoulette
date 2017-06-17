//
//  Double+RoundTo.swift
//  GigRoulette
//
//  Created by apple on 17/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

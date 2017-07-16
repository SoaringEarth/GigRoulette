//
//  Array+Random.swift
//  GigRoulette
//
//  Created by apple on 16/07/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

extension Array {
    func randomElement() -> ArrayLiteralElement {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

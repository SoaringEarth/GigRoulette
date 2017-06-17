//
//  TintedToggleButton.swift
//  GigRoulette
//
//  Created by apple on 17/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class TintedToggleButton: UIButton {
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                self.tintColor = UIColor.red
            } else {
                self.tintColor = UIColor.white
            }
        }
    }
}

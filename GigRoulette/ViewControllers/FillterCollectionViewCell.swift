//
//  FillterCollectionViewCell.swift
//  GigRoulette
//
//  Created by apple on 19/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class FillterCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                self.backgroundColor = UIColor.red
            } else {
                self.backgroundColor = UIColor.white
            }
        }
    }
}

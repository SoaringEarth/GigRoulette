//
//  FillterCollectionViewCell.swift
//  GigRoulette
//
//  Created by apple on 19/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                layer.borderColor = UIColor.red.cgColor
                titleLabel.textColor = UIColor.red
            } else {
                layer.borderColor = UIColor.white.cgColor
                titleLabel.textColor = UIColor.white
            }
        }
    }
    
    var filterName: String = "" {
        didSet {
            titleLabel.text = filterName
            titleLabel.numberOfLines = 2
            titleLabel.adjustsFontSizeToFitWidth = true
            titleLabel.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
    }
}

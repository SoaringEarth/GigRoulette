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
                self.backgroundColor = UIColor.red
            } else {
                self.backgroundColor = UIColor.gray
            }
        }
    }
    
    var filterName: String = "" {
        didSet {
            titleLabel.text = filterName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.borderColor = UIColor.cyan.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
    }
}

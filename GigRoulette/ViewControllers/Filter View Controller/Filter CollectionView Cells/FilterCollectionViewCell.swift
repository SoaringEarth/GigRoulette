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
    
    var genre : GenreEntity? = nil {
        didSet {
            titleLabel.text = genre?.name
            titleLabel.numberOfLines = 1
            titleLabel.textAlignment = .center
        }
    }
    
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
    
    var font: UIFont {
        get {
            return UIFont.systemFont(ofSize: 16.0)
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

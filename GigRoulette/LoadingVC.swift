//
//  LoadingVC.swift
//  GigRoulette
//
//  Created by Ross Patman on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var purchaseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseButton.isHidden = true
        
        animateIconOut()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (timer) in
            let chosenVC = ChosenEventViewController(nibName: "ChosenEventViewController", bundle: nil)
            self.show(chosenVC, sender: nil)
        }
        
    }
    
    func animateIconIn() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.icon.alpha = 0
        }) { (success) in
            self.animateIconIn()
        }
        
    }
    
    func animateIconOut() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.icon.alpha = 1
        }) { (success) in
            self.animateIconOut()
        }
        
    }

}

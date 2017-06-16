//
//  LoadingVC.swift
//  GigRoulette
//
//  Created by Ross Patman on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {
    
    var chosenEvent: EventEntity?
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var purchaseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseButton.isHidden = true
        
        animateIconOut()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (timer) in
            self.purchaseButton.isHidden = false
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
    @IBAction func open(_ sender: Any) {
        let chosenVC = ChosenEventViewController(nibName: "ChosenEventViewController", bundle: nil)
        chosenVC.chosenEvent = self.chosenEvent
        self.show(chosenVC, sender: nil)
    }
    
}

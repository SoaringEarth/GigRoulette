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
    var animate: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseButton.isHidden = true
        
        animateIconOut()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5.4, repeats: false) { (timer) in
            
            self.animate = false
            self.stopAnimation()
        }
        
    }
    
    func animateIconIn() {
        guard animate == true else { return }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.icon.alpha = 1
            self.icon.transform = CGAffineTransform.init(translationX: -self.view.frame.width/1.5, y: 0)
        }) { (success) in
            self.animateIconOut()
            
        }
        
    }
    
    func animateIconOut() {
        guard animate == true else { return }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.icon.alpha = 0.2
            self.icon.transform = CGAffineTransform.init(translationX: -self.view.frame.width/1.5, y: 0)
        }) { (success) in
            self.icon.transform = CGAffineTransform.init(translationX: self.view.frame.width, y: 0)
            self.animateIconIn()
        }
        
    }
    
    func stopAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.icon.alpha = 1.0
            self.icon.transform = CGAffineTransform.identity
        }) { (success) in
            self.purchaseButton.isHidden = false
        }
    }
    @IBAction func open(_ sender: Any) {
        let chosenVC = ChosenEventViewController(nibName: "ChosenEventViewController", bundle: nil)
        self.show(chosenVC, sender: nil)
    }
    
}

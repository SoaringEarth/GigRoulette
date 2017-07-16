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
    
    var chosenEvent: EventEntity?
    
    var animate: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Add more tickets to make it look busier
//        for i in 0...10 {
//            if let ticket = icon {
//                ticket.frame.origin.x += CGFloat(i * 64)
//                view.addSubview(ticket)
//
//                perform(#selector(LoadingVC.animate(Ticket:)), with: ticket, afterDelay: 0.0)
//            }
//        }
        animate(Ticket: self.icon)
    }
    
    @objc func animate(Ticket ticket: UIView) {
        animateIconViewOut(IconViewToAnimate: ticket)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 5.9, repeats: false) { (timer) in
            self.animate = false
            self.stopAnimation(ForView: ticket)
        }
    }
    
    func animateIconViewIn(IconViewToAnimate iconView: UIView) {
        guard animate == true else { return }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            iconView.alpha = 1
            iconView.transform = CGAffineTransform.init(translationX: -self.view.frame.width/1.5, y: 0)
        }) { (success) in
            self.animateIconViewOut(IconViewToAnimate: iconView)
        }
    }
    
    func animateIconViewOut(IconViewToAnimate iconView: UIView) {
        guard animate == true else { return }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            iconView.alpha = 0.2
            iconView.transform = CGAffineTransform.init(translationX: -self.view.frame.width/1.5, y: 0)
        }) { (success) in
            iconView.transform = CGAffineTransform.init(translationX: self.view.frame.width, y: 0)
            self.animateIconViewIn(IconViewToAnimate: iconView)
        }
        
    }
    
    func stopAnimation(ForView view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            view.alpha = 1.0
            view.transform = CGAffineTransform.identity
        }) { (success) in
            self.purchaseButton.isHidden = false
        }
    }
    
    @IBAction func open(_ sender: Any) {
        let chosenVC = ChosenEventViewController(nibName: "ChosenEventViewController", bundle: nil)
        chosenVC.chosenEvent = self.chosenEvent
        navigationController?.pushViewController(chosenVC, animated: true)
    }
}

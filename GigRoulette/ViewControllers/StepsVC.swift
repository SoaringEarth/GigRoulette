//
//  StepsVC.swift
//  GigRoulette
//
//  Created by Ross Patman on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class StepsVC: UIViewController {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var journey: Journey? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(LegCell.self, forCellReuseIdentifier: "legCell")
        tableView.reloadData()
    }

    

}

extension StepsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let journey = journey else { return 0 }
        return journey.legs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let journey = journey else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "legCell", for: indexPath) as! LegCell
        let leg = journey.legs[indexPath.row]
        cell.leg = leg
        return cell
    }
    
    
    
}

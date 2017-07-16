//
//  FiltersViewController.swift
//  GigRoulette
//
//  Created by Emal SAIFI on 16/06/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
    
    var currentGeoHash: String = ""
    var filterViewModel = FiltersViewModel()

    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var priceView: UIView!
    
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
	@IBOutlet weak var musicBTN: UIButton!
	@IBOutlet weak var sportsBTN: UIButton!
	@IBOutlet weak var comedyBTN: UIButton!
	@IBOutlet weak var artBTN: UIButton!
	@IBOutlet weak var familyBTN: UIButton!
	@IBOutlet weak var theatreBTN: UIButton!
	
	@IBOutlet weak var nowBTN: UIButton!
	@IBOutlet weak var tomorrowBTN: UIButton!
	@IBOutlet weak var anytimeBTN: UIButton!
    
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        filterCollectionView?.allowsMultipleSelection = true
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        filterCollectionView.collectionViewLayout = collectionFlowLayout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        if eventsManager.getEvents().count == 0 {
//            filterCollectionView.delegate = nil
//            filterCollectionView.dataSource = nil
//            filterView.removeFromSuperview()
//        }
    }
	
	@IBAction func genreButtonAction(_ sender: Any) {
		let btn:UIButton = sender as! UIButton
        btn.isSelected = !btn.isSelected
	}
    
	@IBAction func partyAction(_ sender: Any) {
        if filterViewModel.getEvents().count > 0 {
            let loadingVC = LoadingVC(nibName: "LoadingVC", bundle: nil)
            loadingVC.chosenEvent = filterViewModel.getEvents().randomElement()
            navigationController?.pushViewController(loadingVC, animated: true)
        }
	}
}

extension FiltersViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(filterViewModel.getGenres().count)
        return filterViewModel.getGenres().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! FilterCollectionViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.filterName = filterViewModel.getGenres()[indexPath.row].name
        
        return cell
    }
}

extension FiltersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

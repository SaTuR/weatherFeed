//
//  WeatherViewController.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/12/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var fullContainer: UIView!
    @IBOutlet weak var weatherCollection: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addButton.layer.masksToBounds = true
        self.addButton.layer.cornerRadius = self.addButton.frame.size.width / 2.0
        
        if DataSingleton.shared.getAllNames().count <= 0 {
            self.perform(#selector(WeatherViewController.tapUpAdd(sender:)), with: self.addButton, afterDelay: 0.2)
        }
        safeReloadCollectionData()

        //TODO: Tu código aquí
        NotificationCenter.default.addObserver(self, selector: #selector(self.safeReloadCollectionData), name: NSNotification.Name(rawValue:"updatedCities"), object: nil)

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue:"updatedCities"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.performSelector(onMainThread: #selector(WeatherViewController.safeReloadCollectionData), with: nil, waitUntilDone: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func safeReloadCollectionData() {
        DispatchQueue.main.async {
            self.weatherCollection.reloadData()
        }
    }
    
    
    @IBAction func tapUpAdd(sender: UIButton) {
        //TODO: Tu código aquí
        performSegue(withIdentifier: "ModalCities", sender: nil)
    }
    
    
    //MARK: - Navigation methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    //MARK: - UICollectionView Delegate and DataSource methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //TODO: Tu código aquí
        return DataSingleton.shared.City.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as! WeatherCollectionViewCell
        
        //TODO: Tu código aquí
        cell.nameLabel.text = DataSingleton.shared.City[indexPath.row].name
        cell.descriptionLabel.text = DataSingleton.shared.City[indexPath.row].forecast[0].description
        cell.temperatureLabel.text = DataSingleton.shared.City[indexPath.row].forecast[0].current.description
        cell.dateLabel.text = Util.getFormattedDate(from: DataSingleton.shared.City[indexPath.row].forecast[0].date, format: "EEEE, d MMM yyy, hh:mm:ss a")
        cell.city = DataSingleton.shared.City[indexPath.row]
        //safeReloadCollectionData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return fullContainer.frame.size
    }

}

//
//  CityManagerViewController.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 4/11/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class CityManagerViewController: UIViewController, UITextFieldDelegate, CitiesTableDelegate {

    
    @IBOutlet weak var fullContainer : UIView!
    @IBOutlet weak var cityText : UITextField!
    @IBOutlet weak var addButton : UIButton!
    @IBOutlet weak var closeButton : UIButton!
    @IBOutlet weak var citiesTable : UITableView!
    
    @IBOutlet weak var loadingContainer : UIView!
    @IBOutlet weak var loadingView : UIActivityIndicatorView!

    @IBOutlet var citiesTableDelegate : CitiesTableDelegateDataSource!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addButton.layer.masksToBounds = true
        self.addButton.layer.borderColor = UIColor.black.cgColor
        self.addButton.layer.borderWidth = 2

        self.closeButton.layer.masksToBounds = true
        self.closeButton.layer.borderColor = UIColor.black.cgColor
        self.closeButton.layer.borderWidth = 2

        self.hideLoading(animated: true)

        //TODO: Tu código aquí
        citiesTableDelegate.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.safeReloadCollectionData), name: NSNotification.Name(rawValue:"updateList"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue:"updateList"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapUpAdd(sender: UIButton) {
        self.cityText.resignFirstResponder()
        //TODO: Tu código aquí
        
        //self.addCity()
        showLoading(animated: true)
        let cityName : String = cityText.text!
        citiesTableDelegate.addCity(cityName: cityName)
    }
    
    @IBAction func tapUpClose(sender: UIButton) {
        self.dismiss(animated: true) { 
            //TODO: Tu código aquí
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updatedCities"), object: self)
        }
    }
    

    func showLoading(animated: Bool) {
        var interval : TimeInterval = 0.0
        if animated {
            interval = 0.3
        }
        
        self.loadingContainer.alpha = 0
        self.loadingContainer.isHidden = false
        self.loadingView.startAnimating()
        self.fullContainer.bringSubview(toFront: self.loadingContainer)
        
        UIView.animate(withDuration: interval, animations: {
            self.loadingContainer.alpha = 1
        }, completion: { (finished) in
        })
    }
    
    func hideLoading(animated: Bool) {
        var interval : TimeInterval = 0.0
        if animated {
            interval = 0.3
        }
        UIView.animate(withDuration: interval, animations: {
            self.loadingContainer.alpha = 0
        }, completion: { (finished) in
            self.loadingContainer.isHidden = true
            self.loadingView.stopAnimating()
            self.fullContainer.sendSubview(toBack: self.loadingContainer)
        })
    }
    
    //MARK: - CitiesTableDelegate methods
    /*func addCity(){
        showLoading(animated: true)
        let cityName : String = cityText.text!
        WeatherFeedServices.shared.weatherData(with: cityName) {( success , city) in
            if success == true{
                debugPrint(success)
                DataSingleton.shared.City.append(city!)
                self.safeReloadCollectionData()
                self.hideLoading(animated: false)
            }
            else {
                debugPrint("error")
            }
        }
    }*/
    
    func addCity(city : CityDataProtocol){
                DataSingleton.shared.City.append(city)
                //self.safeReloadCollectionData()
    }
    
    func deleteCity(index : Int){
        DataSingleton.shared.City.remove(at: index)
        self.safeReloadCollectionData()
    }

    //MARK: - UITextFieldDelegate methods
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func safeReloadCollectionData() {
        self.citiesTable.reloadData()
        self.hideLoading(animated: false)
    }
}

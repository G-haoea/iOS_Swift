//
//  ViewController.swift
//  Weather
//
//  Created by Grace Liu on 10/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    let appid = "d838c529dbd89a6de2937fe3829a17dc"
    
    let weather = Weather()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    /// It only runs once
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /// Firstly, viewController follows CLLocationManagerDelegate
        /// Then, it does sth., but it doesn't know who is its boss
        /// It just knows any cllocationmanager is its boss
        /// So, here, claim that locationManager apply itself for doing sth.
        locationManager.delegate = self
        
        //Set accuracy, higher accuracy with higher power requirement
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        //Require location once
        locationManager.requestLocation()
        
        
    }
    
    
    /// When page appears, it will run
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Apply for location
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    
    
    /// When apply for location, system will use this method automatically
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = locations[0].coordinate.latitude
        let lon = locations[0].coordinate.longitude
        print(lat, lon)
        
        //Dictionary
        let paras = ["lat":"\(lat)", "lon":"\(lon)", "appid":"\(appid)"]
        getWeather(paras: paras)
        
    }

    /// What if applying for location failed
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}

extension ViewController: CLLocationManagerDelegate, SelectCityDelegate{
    
    //Do what has been claimed in protocol
    func didChangeCity(city: String) {
        weather.city = city
        let paras = ["q":"\(weather.city)", "appid":"\(appid)"]
        getWeather(paras: paras)
    }
    
    //Use API to get weather
    func getWeather(paras:[String:String]){
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: paras).responseJSON { response in
            debugPrint(response)
            if let json = response.value{
                let JSONWeather = JSON(json)
                self.createWeather(JSONWeather: JSONWeather)
                self.updateUI()
            }
        }
        
    }
    
    //Create an object of weather
    func createWeather(JSONWeather: JSON) {
        weather.city = JSONWeather["name"].stringValue
        weather.condition = JSONWeather["weather", 0,"id"].intValue
        weather.temp = Int(round(JSONWeather["main", "temp"].doubleValue - 273.15))
    }
    
    //Update UI
    func updateUI() {
        cityLabel.text = "\(weather.city)"
        tempLabel.text = "\(weather.temp)˚"
        weatherImage.image = UIImage(named: "\(weather.icon)")
    }
    
    //It is a process of transferring data to segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectCity"{
            
            //as-->upcasting    Int(3.2)    useless
            //as?-->downcasting    maybe is null     should use: iflet
            //as!-->downcasting   transferred inforced  under a clear condition
            let vc = segue.destination as! SelectCityController
            vc.delegate = self
             
        }
    }
}


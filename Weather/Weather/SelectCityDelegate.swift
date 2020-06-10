//
//  SelectCityDelegate.swift
//  Weather
//
//  Created by Grace Liu on 10/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

/// It is different with others' import Foundation
import UIKit



/// A protocol is required to do as a delegate
protocol SelectCityDelegate {
    /// It is more likely the interface in java that has only method's name
    func didChangeCity(city: String)
}



/// It contains the details of a new viewController to manage segue page
class SelectCityController: UIViewController {

    /// claim a delegate firstly
    var delegate : SelectCityDelegate?
    
    @IBOutlet weak var cityInputField: UITextField!
    
    @IBAction func searchBtn(_ sender: UIButton) {
        /// Use what has been claimed in protocol
        delegate?.didChangeCity(city: cityInputField.text!)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func returnBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

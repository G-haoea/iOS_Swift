//
//  Weather.swift
//  Weather
//
//  Created by Grace Liu on 10/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import Foundation

class Weather {
    var temp = 0
    var city = ""
    var condition = 0
    
    //Compute which condition is equal to which icon
    var icon:String{
        
        switch (condition) {
            
        case 0...300 :
            return "tstorm1"
            
        case 301...500 :
            return "light_rain"
            
        case 501...600 :
            return "shower3"
            
        case 601...700 :
            return "snow4"
            
        case 701...771 :
            return "fog"
            
        case 772...799 :
            return "tstorm3"
            
        case 800 :
            return "sunny"
            
        case 801...804 :
            return "cloudy2"
            
        default :
            return "dunno"
        }
    }
}

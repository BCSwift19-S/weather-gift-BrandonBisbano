//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Brandon Bisbano on 3/15/19.
//  Copyright © 2019 Brandon Bisbano. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemperature = "--"
    
    func getWeather(completed: @escaping () -> ()) {
        let alamoURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(alamoURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    print("**** 'temperature' inside getWeather = \(temperature)")
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemperature = roundedTemp + "°"
                } else {
                    print("Could not return a temperature.")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}


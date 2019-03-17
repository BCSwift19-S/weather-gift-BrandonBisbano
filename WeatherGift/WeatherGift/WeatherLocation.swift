//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Brandon Bisbano on 3/15/19.
//  Copyright © 2019 Brandon Bisbano. All rights reserved.
//

import Foundation
import Alamofire

class WeatherLocation {
    var name = ""
    var coordinates = ""
    
    func getWeather() {
        let alamoURL = urlBase + urlAPIKey + coordinates
        print(alamoURL)
        Alamofire.request(alamoURL).responseJSON { response in
            print(response)
        }
    }
}


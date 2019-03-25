//
//  HourlyWeatherCell.swift
//  WeatherGift
//
//  Created by Brandon Bisbano on 3/24/19.
//  Copyright © 2019 Brandon Bisbano. All rights reserved.
//

import UIKit

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ha"
    return dateFormatter
}()

class HourlyWeatherCell: UICollectionViewCell {
    @IBOutlet weak var hourlyTime: UILabel!
    @IBOutlet weak var hourlyTemperature: UILabel!
    @IBOutlet weak var hourlySmallIcon: UIImageView!
    @IBOutlet weak var raindropImage: UIImageView!
    @IBOutlet weak var hourlyPrecipProb: UILabel!
    
    func update(with hourlyForecast: WeatherLocation.HourlyForecast, timeZone: String) {
        hourlySmallIcon.image = UIImage(named: "small-" + hourlyForecast.hourlyIcon)
        hourlyTemperature.text = String(format: "%2.f", hourlyForecast.hourlyTemperature) + "°"
        let precipProb = hourlyForecast.hourlyPrecipProb * 100
        let isHidden = precipProb < 30.0
        hourlyPrecipProb.isHidden = isHidden
        raindropImage.isHidden = isHidden
        hourlyPrecipProb.text = String(format: "%2.f", precipProb) + "%"
        let dateString = hourlyForecast.hourlyTime.format(timeZone: timeZone, dateFormatter: dateFormatter)
        hourlyTime.text = dateString
    }
}

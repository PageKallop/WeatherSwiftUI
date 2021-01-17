//
//  WeatherModel.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation


struct WeatherModels: Decodable {
    
    let main: Weather
}

struct Weather: Decodable {
    
    var temp: Double?
    var humidity: Double?
}

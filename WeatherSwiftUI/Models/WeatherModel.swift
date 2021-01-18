//
//  WeatherModel.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation
import CoreLocation


struct WeatherModel: Decodable {
        
    var name: String
    var main: Main
    var weather: [Weather]
    
}

struct Main: Decodable {
    
    var temp: Double?
    var humidity: Double?
    
  
}

struct Weather: Decodable {
    
    var description: String?
    var icon: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case icon = "main"
    }
   
 }








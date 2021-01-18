//
//  WeatherModel.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation



struct WeatherModel: Decodable {
  
    var main: Main
}

struct Main: Decodable {
    
    var temp: Double?
    var humidity: Double?
//    var description: [Weather]
  }

struct Weather: Decodable {
    
    var description: String?
}










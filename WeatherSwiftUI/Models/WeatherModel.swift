//
//  WeatherModel.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation



public struct WeatherModel: Decodable {
  
    var main: Main
}

public struct Main: Decodable {
    
    var temp: Double?
    var humidity: Double?
   
  }

public struct Weather: Decodable {
    
    var description: String?
}










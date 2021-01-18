//
//  WeatherList.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation

public struct WeatherList {
    
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(responce: WeatherModel) {
        city = responce.name
        temperature = String(format: "%.0f", responce.main.temp ?? "")
        description = responce.weather.first?.description ?? ""
        iconName = responce.weather.first?.icon ?? "" 
    }
    
}

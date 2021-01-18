//
//  WeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation
import Combine

private let defaultIcon = "☀️"
private let iconMap = [
    "Sunny" : "☀️",
    "Clouds": "☁️",
    "Rain" : "🌧",
    "Snow" : "🌨",
    "Thunderstorm" : "⛈",
    "Windy" : "🌬"
]

public class WeatherViewModel: ObservableObject {
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "__"
    @Published var weatherDescription: String = "__"
    @Published var iconName: String = "" 
   
    
    init() {
        self.weatherService = WeatherService()
        
    }
    
    public func refresh() {
        weatherService.loadWeatherData { (weather) in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)°F"
                self.weatherDescription = weather.description.capitalized
                self.iconName = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }

    
}
    
 
    
    

//
//  WeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    
    private var weatherService: WeatherService!
     
    @Published var weather = Main()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search () {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
        
    }
    
    private func fetchWeather(by city: String) {
        
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                self.weather = weather
            }
        }
    }
}



//private let defaultIcon = "☀️"
//private let iconMap = [
//    "Sunny" : "☀️",
//    "Clouds": "☁️",
//    "Rain" : "🌧",
//    "Snow" : "🌨",
//    "Thunderstorm" : "⛈",
//    "Windy" : "🌬"
//]
//
//public class WeatherViewModel: ObservableObject {
//
//let weatherService: WeatherService
//    init(weatherService: WeatherService) {
//        self.weatherService = weatherService
//    }
//
//    @Published var cityName: String = "City Name"
//    @Published var temperature: String = "__"
//    @Published var weatherDescription: String = "__"
//    @Published var iconName: String = ""
//
//
//    init() {
//        self.weatherService = WeatherService()
//
//    }
//}
    
 
    
    

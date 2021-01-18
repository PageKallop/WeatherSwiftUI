//
//  WeatherService.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation


class WeatherService {
    
     func getWeather(city: String, completion: @escaping (Main?) ->()) {
        guard let url = URL(string: "https:api.openweathermap.org/data/2.5/weather?lq=\(city)&appid=&units=imperial") else {
            completion(nil)
            return
        }
               
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponce = try? JSONDecoder().decode(WeatherModel.self, from: data)
            if let weatherResponce = weatherResponce {
                let weather = weatherResponce.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        
        } .resume()
        
    }
}
   







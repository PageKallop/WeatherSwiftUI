//
//  WeatherService.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import Foundation
import CoreLocation


public final class WeatherService: NSObject {
    
        
    private let locationManager = CLLocationManager()
    private var completionHandler: ((WeatherList) -> Void)?
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }

    
    public func loadWeatherData(_ completionHandler: @escaping((WeatherList) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        print("loadweather")
    }
    
    private func locationRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let url = URL(string: "https:api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=&units=imperial")
                
        else {
            print("urlloca")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data, error == nil else {
                return
            }
            
            let responce = try? JSONDecoder().decode(WeatherModel.self, from: data)
            self.completionHandler?(WeatherList(responce: responce!))
            }
        .resume()
        }
    
     }




extension WeatherService: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
        
        guard let location = locations.first else {return}
        locationRequest(forCoordinates: location.coordinate)
        print("LM")
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error with \(error.localizedDescription)")
        
    }
}





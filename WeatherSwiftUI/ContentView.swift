//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text(weatherVM.cityName)
                .font(.largeTitle)
                .padding()
            Text(weatherVM.temperature)
                .font(.system(size: 70))
                .bold()
            Text(weatherVM.iconName)
                .font(.largeTitle)
                .padding()
            Text(weatherVM.weatherDescription)

        }.onAppear(perform: {
            weatherVM.refresh()
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(weatherVM: WeatherViewModel(weatherService: WeatherService()))
    }
}


//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Page Kallop on 1/17/21.
//

import SwiftUI


struct ContentView: View {
    

    
    @ObservedObject var weatherVM: WeatherViewModel
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        
        VStack {
            Text("☀️ 🌧 🌨")
                .padding(.bottom, 100)
                .font(.largeTitle)
            Text("Today's Weather")
                .font(.largeTitle)
            
            TextField("Enter city name", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }.font(.custom("Arial", size: 50))
            .cornerRadius(5)
//            .frame(width: 350, height: 200, alignment: .center)
            .shadow(radius: 10)
            
            .padding()
            .fixedSize()
            
            Text(self.weatherVM.temperature)
                .frame(width: 200, height: 50, alignment: .center)
                .shadow(radius: 10)
                .font(.custom("Arial", size: 50))
                .offset(y: 100)
                .padding()
     
             
             

        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
     
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


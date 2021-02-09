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

            }.font(.custom("Arial", size: 50))
            .cornerRadius(5)
//            .frame(width: 350, height: 200, alignment: .center)
            .shadow(radius: 10)
            .padding()
            .fixedSize()
            
            
            VStack {
                
                Button(action: {
                self.weatherVM.search()

                }) {
                    VStack {
                    Text("Search")
                    
                Image(systemName: "thermometer")
                    .font(.title)
                    .animation(.spring())
                .font(.title)
            }.padding(EdgeInsets(top: 15, leading: 55, bottom: 15, trailing: 55))
            .foregroundColor(Color.black)
            .background(Color.white)
            .cornerRadius(116)
                }.shadow(radius: 8, x: 8, y: 8)
                Text(self.weatherVM.temperature)
                    .frame(width: 200, height: 50, alignment: .center)
                    .shadow(radius: 10)
                    .font(.custom("Arial", size: 50))
                    .offset(y: 100)
        
        }
    
    }.background(Color(red: 179/255, green: 230/255, blue: 255/255))
        .frame(minWidth: 0, maxWidth: .infinity,
            minHeight: 0, maxHeight: .infinity)
        .background(Color(red: 179/255, green: 230/255, blue: 255/255))
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


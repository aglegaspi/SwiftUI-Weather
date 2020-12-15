//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Alex 6.1 on 12/8/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill",
                                      temperature: 76)
                
                HStack {
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "sun.max.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 76)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.fill",
                                   temperature: 78)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.rain.fill",
                                   temperature: 77)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "sun.max.fill",
                                   temperature: 83)
                
                }
                
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top,100)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}



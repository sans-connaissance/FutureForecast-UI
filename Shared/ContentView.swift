//
//  ContentView.swift
//  Shared
//
//  Created by David Malicke on 7/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                
                CityTextView(cityName: "Ann Arbor, MI")
                
                VStack(spacing: 9){
                    MainWeatherStatusView(imageName: "cloud.sun.fill", temp: 76)
                    
                    HStack(spacing: 20) {
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", temp: 78)
                        WeatherDayView(dayOfWeek: "WED", imageName: "cloud.bolt.fill", temp: 32)
                        WeatherDayView(dayOfWeek: "THUR", imageName: "cloud.sleet.fill", temp: 50)
                        WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temp: 65)
                        WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.rain.fill", temp: 115)
                        
                        
                    }
                    Spacer()
                    Button {
                        print("tapped")
                    } label: {
                        WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                    }
                    
                    Spacer()
                    
                }
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
    var temp: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 9){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            //hardcoded font
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
        
    }
}



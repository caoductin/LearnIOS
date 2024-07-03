//
//  ContentView.swift
//  weather
//
//  Created by cao duc tin  on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherApi()
    @State var weather: ResponseBody?
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather {
                    Text("Weather data fetch")
                    
                }
                else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                            }catch{
                                print("Error getting weather:\(error)")
                                
                            }
                            
                        }
                }
            }
            else{
                if locationManager.isLoading {
                    LoadingView()
                }
                else{
                    HomeView()
                        .environmentObject(locationManager)
                }
            }
         
        }
        .background(Color(hue: 0.253, saturation: 0.81, brightness: 0.855, opacity: 0.915))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

//
//  weatherView.swift
//  weather
//
//  Created by cao duc tin  on 2/7/24.
//

import SwiftUI

struct weatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack (alignment: .center, content: {
            VStack{
                VStack(alignment: .leading, content: {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light )
//                    Text(weather.weather[0].description)
//                    Text("\(weather.main.feelsLike)")
//                    Text("\(weather.main.feels_like)")
                })
                .frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
             
                VStack{
                    HStack{
                        VStack(spacing: 20, content: {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        })
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "✵")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(.all)
                         
                    }
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg")){ image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                            .clipShape(Circle())
                            .overlay(
                                Circle().strokeBorder(LinearGradient(
                                    gradient: Gradient(colors: [.red, .blue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing),
                                    lineWidth: 7 // Gradient border with specified width
                                )
                            )
                            .shadow(radius: 10)
                            
                    } placeholder: {
                        Text("Erorr for loading image")
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
         
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading )
            VStack{
                Spacer()
                VStack{
                    Text("Weather Now")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(Color(.blue))
               
                    HStack(content: {
                        WeatherRow(logo: "wind", name: "Min temp", value: (weather.main.tempMin.roundDouble()) + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: "20")
                    })
                    .padding(.all)
                    HStack(content: {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidit", value: weather.main.humidity.roundDouble() + "%")
                    })
                    .padding(.all)
                  
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(Color.white, lineWidth: 1)
                )
            }
        })
        .ignoresSafeArea(edges: .bottom)
        
        .background(Color(hue: 0.253, saturation: 0.81, brightness: 0.855, opacity: 0.915))
        .preferredColorScheme(.light)
        
    }
}

#Preview {
    weatherView(weather: previewWeather	)
}

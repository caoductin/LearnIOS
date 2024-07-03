//
//  WeatherRow.swift
//  weather
//
//  Created by cao duc tin  on 2/7/24.
//

import SwiftUI

struct WeatherRow: View {
    @State var logo: String
    @State var name: String
    @State var value: String
    var body: some View {
       
        VStack{
            HStack{
                Image(systemName: logo)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .frame(height: 60)
                    .background(Circle()
                        .frame(width: 60,height: 60)
                        .foregroundStyle(Color.green.opacity(0.4)
                        ))
                    
                VStack(alignment: .leading){
                       Text(name)
                        .font(.system(size: 16))
                        .padding(.bottom,4)
                    Text("\(value)°C")
                        .font(.title2)
                        .fontWeight(.bold)
                      
                }
                .frame(height: 60)
                .padding(.leading,20)
              
            
            }
            .frame(height: 60)
         
                
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Wind speed", value: "10")
}

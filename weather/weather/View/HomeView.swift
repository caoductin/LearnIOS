//
//  HomeView.swift
//  weather
//
//  Created by cao duc tin  on 1/7/24.
//

import SwiftUI
import CoreLocationUI

struct HomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to the weather App")
                    .bold()
                    .font(.title)
                Text("Please share your current location to get weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            LocationButton(.shareCurrentLocation) {
                // Fetch location with Core Location.
                locationManager.requestLocation()
            }
            .clipShape(Capsule())
            .symbolVariant(.fill)
            .labelStyle(.titleAndIcon)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
}

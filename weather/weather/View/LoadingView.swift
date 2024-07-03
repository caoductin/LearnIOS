//
//  ProgressView.swift
//  weather
//
//  Created by cao duc tin  on 1/7/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
       ProgressView()
            .progressViewStyle(.circular)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
         
           
    }
}

#Preview {
    LoadingView()
}

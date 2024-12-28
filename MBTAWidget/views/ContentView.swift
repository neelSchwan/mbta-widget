//
//  ContentView.swift
//  MBTAWidget
//
//  Created by Neel Sawant on 12/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var deviceLocation = LocationManager.shared;
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            if let location = deviceLocation.currentLocation {
                Text("Latitude: \(location.coordinate.latitude)")
                Text("Longitude: \(location.coordinate.longitude)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  MBTAWidget
//
//  Created by Neel Sawant on 12/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var deviceLocation = LocationManager.shared
    @StateObject private var client = MBTAAPIClient()
    @State private var errorMessage: String?
    @State private var stations: Station?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            if let location = deviceLocation.currentLocation {
                Text("Latitude: \(location.coordinate.latitude)")
                Text("Longitude: \(location.coordinate.longitude)")
            }
            
            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                if let station = stations {
                    VStack(alignment: .leading) {
                        Text("Station: \(station.attributes.name ?? "Unknown Station")")
                        Text("Coordinates: \(station.attributes.latitude), \(station.attributes.longitude)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .onAppear {
            Task {
                do {
                    stations = try await client.fetchStations()
                } catch {
                    errorMessage = "Failed to load stations: \(error.localizedDescription)"
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

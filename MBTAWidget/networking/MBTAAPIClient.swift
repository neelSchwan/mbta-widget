//
//  MBTAAPIClient.swift
//  MBTAWidget
//
//  Created by Neel Sawant on 12/27/24.
//

import Foundation

/*
 This class is responsible for making API calls to the MBTA-v3-api at the
 'https://api-v3.mbta.com/stops/' endpoint.
 */

public class MBTAAPIClient: ObservableObject {
    
    func fetchStations() async throws -> Station {
        let url = URL(string: "https://api-v3.mbta.com/stops/2")!
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Debugging JSON response
            let jsonString = String(data: data, encoding: .utf8)
            print("Response JSON: \(jsonString ?? "Invalid JSON")")
            
            let stationResponse = try JSONDecoder().decode(StationResponse.self, from: data)
            return stationResponse.data
    }
}



import Foundation

// Root-level response
struct StationResponse: Decodable {
    let data: Station
}

// Individual station data
struct Station: Decodable, Identifiable {
    let id: String // Matches the "id" field in the JSON, which is a string
    let attributes: StationAttributes // Maps to the "attributes" object
}

// Attributes for a station
struct StationAttributes: Decodable {
    let latitude: Double
    let longitude: Double
    let name: String?
}

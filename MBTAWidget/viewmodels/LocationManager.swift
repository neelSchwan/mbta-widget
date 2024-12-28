//
//  LocationManager.swift
//  MBTAWidget
//
//  Created by Neel Sawant on 12/26/24.
//

import CoreLocation
import Foundation

public class LocationManager: NSObject, ObservableObject {
    
    @Published public var currentLocation: CLLocation? // lat, lon
    @Published public var authStatus: CLAuthorizationStatus?
    
    private let locationManager = CLLocationManager();
    
    static let shared = LocationManager();
    
    private override init() {
        super.init();
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestWhenInUseAuthorization();
        locationManager.startUpdatingLocation();
        
    }
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
    
        case .notDetermined:
            authStatus = CLAuthorizationStatus.notDetermined;
            print("user hasn't determined auth status.");
        case .restricted:
            authStatus = CLAuthorizationStatus.restricted;
            print("sytem denied location access.");
        case .denied:
            authStatus = CLAuthorizationStatus.denied;
            print("user selected 'dont allow' for location.");
        case .authorizedAlways:
            authStatus = CLAuthorizationStatus.authorizedAlways;
            print("user selected 'always allow' for location data.");
        case .authorizedWhenInUse:
            authStatus = CLAuthorizationStatus.authorizedWhenInUse;
            print("user selected 'allow once,' or 'Allow while using app' for location data.")
        @unknown default:
            break;
        }
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last;
    }
}




//
//  MapView.swift
//  SocialMate
//
//  Created by Raunit Raj on 20/04/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .userLocation(fallback: .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 31.2551, longitude: 75.7056),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    ))
    
    var body: some View {
        Map(position: $position, interactionModes: .all)
            .mapControls {
                MapUserLocationButton()
            }
            .ignoresSafeArea()
            .navigationTitle("Map")
            .onAppear {
                CLLocationManager().requestWhenInUseAuthorization()
            }
    }
}

#Preview {
    MapView()
}


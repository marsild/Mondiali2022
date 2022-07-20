//
//  MapView.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 19/07/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var latitudine: Double
    var longitudine: Double
    @Environment(\.verticalSizeClass) var sizeClass
    private var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitudine, longitude: longitudine)
    }
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(locationCoordinates)
            }
    }
    
    func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitudine: 0.0, longitudine: 0.0)
    }
}

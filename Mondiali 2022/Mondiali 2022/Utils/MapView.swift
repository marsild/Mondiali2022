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
    var showPin: Bool
    @Environment(\.verticalSizeClass) var sizeClass
    private var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitudine, longitude: longitudine)
    }
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        if(showPin){
            let annotationItems: [MyAnnotationItem] = [
                MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: latitudine, longitude: longitudine))
            ]
            Map(coordinateRegion: $region, annotationItems: annotationItems){item in
                MapPin(coordinate: item.coordinate)
            }.onAppear {
                setRegion(locationCoordinates, latDelta: 0.01, longDelta: 0.01)
            }
        } else {
            Map(coordinateRegion: $region).onAppear {
                setRegion(locationCoordinates, latDelta: 0.8, longDelta: 0.8)
            }
        }
        
    }
    
    func setRegion(_ coordinate: CLLocationCoordinate2D, latDelta: Double, longDelta: Double) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta))
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitudine: 0.0, longitudine: 0.0, showPin: true)
    }
}

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

//
//  MfgListView.swift
//  au-module9-api
//
//  Created by user280687 on 7/18/25.
//

import SwiftUI
import MapKit

struct BreweryDetailView: View {
    
    @EnvironmentObject var brew: BreweryViewModel
    let brewery : BreweryModel
    var breweryCoordinates: CLLocationCoordinate2D
    @State private var camera: MapCameraPosition = .automatic


    init(brewery: BreweryModel) {
        self.brewery = brewery
        self.breweryCoordinates = CLLocationCoordinate2D(latitude: CLLocationDegrees(brewery.latitude ?? 0.0), longitude: CLLocationDegrees(brewery.longitude ?? 0.0))
    }

    
    var body: some View {
        VStack(alignment: .leading) {
            if (breweryCoordinates.latitude != 0.0 && breweryCoordinates.longitude != 0.0) {
                Map(position: $camera, interactionModes: [.all]) {
                    Marker("Brewery",coordinate: breweryCoordinates)
                }
                .mapStyle(.hybrid)
                .mapControls() {
                    MapScaleView()
                    MapUserLocationButton()
                    MapCompass()
                    MapPitchToggle()
                }
                
                .onAppear {
                    let tempCam = MapCamera(
                        centerCoordinate: breweryCoordinates,
                        distance: 1000
                    )
                    self.camera = .camera(tempCam)
                }
            } else {
                Text("No map location for this brewery")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            Text(brewery.name ?? "No brewery name Provided")
            Text("\(brewery.address_1 ?? "")")
            if let address_2 = brewery.address_2, !address_2.isEmpty {
                Text(brewery.address_2 ?? "")
            }
            if let address_3 = brewery.address_3, !address_3.isEmpty {
                Text(brewery.address_3 ?? "")
            }
            Text("\(brewery.city ?? ""), \(brewery.state ?? "")")
            Text("Phone: \(brewery.phone ?? "No phone number provided")")
            Link(destination: (URL(string: brewery.website ?? "") ?? URL(string: "about:blank"))!) {
                Text("\(URL(string: brewery.website ?? "")?.host ?? "No website provided")")
            }

        }
        .padding(40)
        .background(Color.mint.opacity(0.1)).edgesIgnoringSafeArea(.horizontal)
    }

}

#Preview {
    BreweryDetailView(brewery: BreweryModel(
                    id: "12345",
                    name: "Coors",
                    type: "macroswill",
                    address_1: "12345 Swill St",
                    address_2: "",
                    address_3: "",
                    city: "Golden",
                    state: "CO",
                    zip: "80401",
                    country: "United States",
                    longitude: -105.23,
                    latitude: 39.75,
                    phone: "555-867-5309",
                    website: "https://www.coorsswill.com",
                    street: "12345 Swill St"
                    )
    )
    .environmentObject(BreweryViewModel())
}

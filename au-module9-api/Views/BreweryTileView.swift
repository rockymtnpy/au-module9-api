//
//  MfgListView.swift
//  au-module9-api
//
//  Created by user280687 on 7/18/25.
//

import SwiftUI
import MapKit

struct BreweryTileView: View {
    
    @EnvironmentObject var brew: BreweryViewModel
    let brewery : BreweryModel
    
    init(brewery: BreweryModel) {
        self.brewery = brewery
    }
    
    var body: some View {
        //NavigationLink(destination: BreweryDetailView(brewery: brewery)) {
        Text("\(brewery.name ?? "Empty Name")")
        //}
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(Color.gray)
        .foregroundStyle(Color.white)
        .cornerRadius(25)

    }
}

#Preview {
    BreweryTileView(brewery: BreweryModel(
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

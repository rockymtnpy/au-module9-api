//
//  MfgListView.swift
//  au-module9-api
//
//  Created by user280687 on 7/18/25.
//

import SwiftUI

struct BreweryListView: View {
    
    @EnvironmentObject var brew: BreweryViewModel
    @State var zipcode: String
    
    var body: some View {
        NavigationStack {
            Spacer()
            ScrollView {
                if brew.breweries.isEmpty {
                    Spacer()
                    Text("No breweries found in this zip code")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                
                } else {
                    ForEach(brew.breweries) { location in
                        NavigationLink(destination: BreweryDetailView(brewery: location)) {                        
                            BreweryTileView(brewery: location)
                        }
                    }
                }
            }
            .padding(10)
            .background(Color.mint.opacity(0.1))

        }
        .task {
            await brew.fetchBreweries(zip: zipcode)
        }
    }
}

#Preview {
    BreweryListView(zipcode: "80524")
        .environmentObject(BreweryViewModel())
}

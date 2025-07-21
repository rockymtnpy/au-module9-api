//
//  MfgListView.swift
//  au-module9-api
//
//  Created by user280687 on 7/18/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchZip : String = ""
    
    @EnvironmentObject var brew: BreweryViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Brewery Search by Zip Code")
                HStack {
                    TextField("Enter Zip Code", text: $searchZip)
                        .border(Color.gray,width: 2)
                        .cornerRadius(2)
                        .padding(5)
                    NavigationLink(destination: BreweryListView(zipcode: searchZip)) {
                        Text("Search")
                    }
                }
                //.padding(40)
                Spacer()
            }
            .padding(40)
            .background(Color.mint.opacity(0.1))
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(BreweryViewModel())
}

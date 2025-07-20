//
//  ContentView.swift
//  au-module9-api
//
//  Created by user280687 on 7/18/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var brew : BreweryViewModel
    let backgroundGradient = LinearGradient(
        colors: [Color.red, Color.blue],
        startPoint: .top, endPoint: .bottom)

    var body: some View {
        VStack {
            Spacer()
            SearchView()
            Spacer()
            Text("Powered by Open Brewery DB")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
        .padding(.horizontal, 40) 
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("bkground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
        )
    }
}

#Preview {
    ContentView()
        .environmentObject(BreweryViewModel())
}

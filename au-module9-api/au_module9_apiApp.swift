//
//  au_module9_apiApp.swift
//  au-module9-api
//
//  Created by user280687 on 7/18/25.
//

import SwiftUI

@main
struct au_module9_apiApp: App {
    
    @StateObject var brew = BreweryViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(brew)
        }
    }
}

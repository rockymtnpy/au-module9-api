//
//  MfgViewModel.swift
//  au-module9-api
//
//  Created by user280687 on 7/18/25.
//

import Foundation

class BreweryViewModel: ObservableObject {
    
    @Published var breweries: [BreweryModel] = []
    @Published var isLoading = false
    @Published var hasError = false

    @MainActor
    func fetchBreweries(zip: String) async {
        self.isLoading = true
        self.breweries.removeAll()
        
        let baseUrl = "https://api.openbrewerydb.org/v1/breweries"
        
        guard var components = URLComponents(string : baseUrl) else { return }
        components.queryItems = [
            URLQueryItem(name: "by_postal", value: zip)
        ]
        
        guard let url = components.url else { return }
        
        do {
            //print("Inside task search for \(zip)")
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let response = try JSONDecoder().decode([BreweryModel].self, from: data)
            //print("Response: \(response)")
            
            self.breweries = response
            self.isLoading = false
            
            
        } catch {
            print("caught error \(error)")
            self.hasError = true
            self.isLoading = false
        }
    }
    
    struct BreweryAPIResponse: Codable {
        let Results : [BreweryModel]
    }
}

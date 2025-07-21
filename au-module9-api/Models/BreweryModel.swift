//
//  MfgModel.swift
//  au-module9-api
//
//  Created by user280687 on 7/18/25.
//

import Foundation

struct BreweryModel: Codable, Identifiable {
    
    var id: String
    var name: String?
    var type: String?
    var address_1: String?
    var address_2: String?
    var address_3: String?
    var city: String?
    var state: String?
    var zip: String?
    var country: String?
    var longitude: Double?
    var latitude: Double?
    var phone: String?
    var website: String?
    var street: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type = "brewery_type"
        case address_1
        case address_2
        case address_3
        case city
        case state
        case zip = "postal_code"
        case country
        case longitude
        case latitude
        case phone
        case website = "website_url"
        case street
    }
   
}


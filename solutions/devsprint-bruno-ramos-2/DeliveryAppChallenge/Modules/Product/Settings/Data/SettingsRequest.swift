//
//  SettingsRequest.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 02/02/22.
//

import Foundation

struct SettingsRequest: NetworkRequest {
    
    let pathURL: String = "user_settings.json"
    let method: HTTPMethod = .get
}

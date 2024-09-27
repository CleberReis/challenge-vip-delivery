//
//  SettingsResponse.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 02/02/22.
//

import Foundation

struct SettingsResponse: Codable {
    let name: String
    let email: String
    let address: String
    let paymentMethod: String

    enum CodingKeys: String, CodingKey {
        case name, email, address
        case paymentMethod = "payment_method"
    }
}

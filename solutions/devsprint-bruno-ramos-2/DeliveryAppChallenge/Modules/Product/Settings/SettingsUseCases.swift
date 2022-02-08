//
//  SettingsUseCases.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 26/01/22.
//

import Foundation

enum Settings {
    enum FetchData {
        struct Request {}
        
        enum Response {
            case success(SettingsResponse)
            case failure(Error)
        }
        
        struct viewModel {}
    }
    
}

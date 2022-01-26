//
//  SettingsUseCases.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 26/01/22.
//

import Foundation

enum Settings {
    enum FetchData {
        struct Request {
            
        }
        
        struct Response {
            let data: String
        }
        
        enum ViewModel {
            case filled(data: String)
            case retry
            case error
        }
    }
    
    enum Error {
        struct Response {
            let error: Swift.Error
        }
        
        struct ViewModel {
            let message: String
        }
    }
}

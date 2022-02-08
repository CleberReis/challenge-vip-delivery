//
//  SettingsWorker.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 02/02/22.
//

import Foundation

protocol SettingsWorking {
    func fetchSettingsData(completion: @escaping (Result<SettingsResponse, Error>) -> Void)
}

class SettingsWorker: SettingsWorking {

    private let network: NetworkManagerProtocol
    
    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func fetchSettingsData(completion: @escaping (Result<SettingsResponse, Error>) -> Void) {
        
        network.request(SettingsRequest()) { (result:Result<SettingsResponse, Error>) in
            completion(result)
        }
    }
    
}

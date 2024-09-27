//
//  SettingsInteractor.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 26/01/22.
//

import Foundation
import UIKit

protocol SettingsBusinessLogic {
    func fetchData(request: Settings.FetchData.Request)
}

protocol SettingsDataStore {
    
}

final class SettingsInteractor: SettingsDataStore {
    private let presenter: SettingsPresentationLogic
    private let worker: SettingsWorking // worker
    
    init(
        presenter: SettingsPresentationLogic,
        worker: SettingsWorking
    ) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension SettingsInteractor: SettingsBusinessLogic {
    
    func fetchData(request: Settings.FetchData.Request) {
        worker.fetchSettingsData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let data):
                    self.presenter.presentFetchedSettings(response: .success(data))
                case .failure(let error):
                    self.presenter.presentFetchedSettings(response: .failure(error))
            }
        }
    }
}

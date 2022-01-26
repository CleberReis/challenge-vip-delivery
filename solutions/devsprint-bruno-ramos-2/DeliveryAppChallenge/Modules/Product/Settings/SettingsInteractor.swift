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
    private let getData: GetSampleUseCase
    
    init(
        presenter: SettingsPresentationLogic,
        getData: GetSampleUseCase
    ) {
        self.presenter = presenter
        self.getData = getData
    }
}

extension SettingsInteractor: SettingsBusinessLogic {
    
    func fetchData(request: Settings.FetchData.Request) {
        getData.execute { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let data):
                    self.presenter.presentData(response: .init(data: data.data))
                case .failure(let error):
                    self.presenter.presentError(response: .init(error: error))
            }
        }
    }
}

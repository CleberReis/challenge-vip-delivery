//
//  SettingsPresenter.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 26/01/22.
//

protocol SettingsPresentationLogic {
    func presentData(response: Settings.FetchData.Response)
    func presentError(response: Settings.Error.Response)
}

import Foundation

final class SettingsPresenter {
    weak var viewController: SettingsDisplayLogic?
}

extension SettingsPresenter: SettingsPresentationLogic {
    func presentData(response: Settings.FetchData.Response) {
        let viewModel = response.data
        viewController?.displayData(viewModel: .filled(data: viewModel))
    }
    
    func presentError(response: Settings.Error.Response) {

    }
}

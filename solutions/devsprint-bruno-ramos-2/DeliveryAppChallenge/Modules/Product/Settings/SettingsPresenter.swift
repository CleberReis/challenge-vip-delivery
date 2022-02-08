//
//  SettingsPresenter.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 26/01/22.
//

protocol SettingsPresentationLogic {
    func presentFetchedSettings(response: Settings.FetchData.Response)
}

import Foundation

final class SettingsPresenter {
    weak var viewController: SettingsDisplayLogic?
}

extension SettingsPresenter: SettingsPresentationLogic {
    func presentFetchedSettings(response: Settings.FetchData.Response) {}
}

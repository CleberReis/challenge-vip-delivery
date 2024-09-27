//
//  SettingsFeatureFactory.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 26/01/22.
//

import UIKit

enum SettingsConfigurator: FeatureFactory {
    struct Dependencies {}
    
    static func make(with dependencies: Dependencies) -> UIViewController {
        let view = SettingsView()
        let presenter = SettingsPresenter()
        let network = NetworkManager()
        let worker = SettingsWorker(network: network)
        let interactor = SettingsInteractor(presenter: presenter, worker: worker)
        let router = SettingsRouter()
        
        
        let viewController = SettingsViewController(customView: view,
                                                    interactor: interactor,
                                                    router: router)
        
        view.delegate = viewController
        router.dataStore = interactor
        presenter.viewController = viewController
        
        return viewController
    }
}

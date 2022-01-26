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
        let network = NetworkManager()
        let apiDataSource = SampleApiDataSource(network: network)
        let repository = SampleRepositoryImpl(dataSource: apiDataSource)
        let getData = GetData(repository: repository)
        let presenter = SettingsPresenter()
        let router = SettingsRouter()
        let interactor = SettingsInteractor(presenter: presenter, getData: getData)
        let view = SettingsView()
        let viewController = SettingsViewController(customView: view,
                                                    interactor: interactor,
                                                    router: router)
        
        view.delegate = viewController
        router.dataStore = interactor
        presenter.viewController = viewController
        
        return viewController
    }
}

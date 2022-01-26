//
//  SettingsRouter.swift
//  DeliveryAppChallenge
//
//  Created by Cleber Reis on 26/01/22.
//

import UIKit

protocol SettiingsRoutingLogic {
    func routeToNextModule()
}

protocol SettingsDataPassing {
    var dataStore: SettingsDataStore? { get }
}

typealias SettingsRouterType = (SettiingsRoutingLogic & SettingsDataPassing)

final class SettingsRouter: SettiingsRoutingLogic, SettingsDataPassing {
    
    weak var viewController: SettingsViewController?
    var dataStore: SettingsDataStore?
    
    init(){
        
    }
    
    func routeToNextModule() {
        let newViewController = UIViewController()
        viewController?.navigationController?.pushViewController(newViewController, animated: true)
    }
}

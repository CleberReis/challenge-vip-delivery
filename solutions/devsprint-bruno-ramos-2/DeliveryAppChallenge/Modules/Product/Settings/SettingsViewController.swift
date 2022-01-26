//
//  SettingsViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

protocol SettingsDisplayLogic: AnyObject {
    func displayData(viewModel: Settings.FetchData.ViewModel)
}

final class SettingsViewController: UIViewController {
    
    private let interactor: SettingsInteractor
    private let router: SettingsRouter
    private let customView: SettingsViewProtocol

    init(customView: SettingsViewProtocol,
         interactor: SettingsInteractor,
         router: SettingsRouter
    ) {
        self.customView = customView
        self.interactor = interactor
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Settings"
    }
    
    @available(*, unavailable)
    required init?(coder _ : NSCoder) {
        nil
    }
    
    override func loadView() {
        self.view = SettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        let request = Settings.FetchData.Request()
        interactor.fetchData(request: request)
    }
}

extension SettingsViewController: SettingsDisplayLogic {
    func displayData(viewModel: Settings.FetchData.ViewModel) {
        
    }
}

extension SettingsViewController: SettingsViewDelegate {
    
}

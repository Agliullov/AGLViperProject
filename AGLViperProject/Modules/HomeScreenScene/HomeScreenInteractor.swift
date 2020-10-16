//
//  HomeScreenInteractor.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 30.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeScreenBusinessLogic {
    func openHomeScreenDetails(request: HomeScreenModel.OpenHomeScreenDetails.Request)
}

protocol HomeScreenDataStore {
    var homeScreenData: [HomeScreenData]? { get set }
}

class HomeScreenInteractor: HomeScreenDataStore {
    var homeScreenData: [HomeScreenData]?
    
    var presenter: HomeScreenPresentationLogic?
    private let worker: HomeScreenWorker = HomeScreenWorker()
    
    private var mode: ControllerMode = .viewing {
        didSet {
            let response = HomeScreenModel.ChangeControllerMode.Response(mode: self.mode)
            self.presenter?.presentHomeScreenChangeControllerMode(response: response)
        }
    }
}

extension HomeScreenInteractor: HomeScreenBusinessLogic {
    
    func openHomeScreenDetails(request: HomeScreenModel.OpenHomeScreenDetails.Request) {
        self.mode = .updating
        DispatchQueue.main.async {
            self.worker.getLocalHomeScreenData { (homeScreenData) in
                guard let data = homeScreenData else { return }
                self.homeScreenData = data
                self.mode = .viewing
                
                let response = HomeScreenModel.OpenHomeScreenDetails.Response()
                self.presenter?.presentHomeScreenOpenDetails(response: response)
            }
        }
    }
}
//
//  RestaurantMenuInteractor.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 01.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RestaurantMenuBusinessLogic {
    func fetchRestaurantMenuData(request: RestaurantMenuModel.FetchRestaurantMenuData.Request)
    func openRestaurantMenuDetails(request: RestaurantMenuModel.OpenRestaurantMenuDetails.Request)
}

protocol RestaurantMenuDataStore {
    var restaurantMenuData: [HomeScreenData]? { get set }
}

class RestaurantMenuInteractor: RestaurantMenuDataStore {
    var restaurantMenuData: [HomeScreenData]?
    
    var presenter: RestaurantMenuPresentationLogic?
    
    private let worker: RestaurantMenuWorker = RestaurantMenuWorker()
    
    private var mode: ControllerMode = .viewing {
        didSet {
            let response = RestaurantMenuModel.ChangeControllerMode.Response(mode: self.mode)
            self.presenter?.presentChangeControllerMode(response: response)
        }
    }
}

extension RestaurantMenuInteractor: RestaurantMenuBusinessLogic {
    
    func fetchRestaurantMenuData(request: RestaurantMenuModel.FetchRestaurantMenuData.Request) {
        let response = RestaurantMenuModel.FetchRestaurantMenuData.Response(restaurantMenuData: self.restaurantMenuData ?? [])
        self.presenter?.presentFetchedRestaurantMenuData(response: response)
    }
    
    func openRestaurantMenuDetails(request: RestaurantMenuModel.OpenRestaurantMenuDetails.Request) {
        worker.getLocalRestaurantMenuData { (restaurantMenuData) in
            guard let data = restaurantMenuData?[request.index] else { return }
            
            let response = RestaurantMenuModel.OpenRestaurantMenuDetails.Response(restaurantMenuData: data)
            self.presenter?.presentOpenRestaurantMenuDetails(response: response)
        }
    }
}

//
//  HomeScreenRouter.swift
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

@objc protocol HomeScreenRoutingLogic {
    func routeToRestaurantMenu()
}

protocol HomeScreenDataPassing {
    var dataStore: HomeScreenDataStore? { get }
}

class HomeScreenRouter: NSObject, HomeScreenDataPassing {
    
    weak var viewController: HomeScreenViewController?
    var dataStore: HomeScreenDataStore?
    
    // MARK: Navigation
    
    func navigateToRestaurantMenu(source: HomeScreenViewController, destination: RestaurantMenuViewController)
    {
        destination.navigationItem.setHidesBackButton(true, animated: true)
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToRestaurantMenu(source: HomeScreenDataStore, destination: inout RestaurantMenuDataStore)
    {
        destination.restaurantMenuData = source.homeScreenData
    }
}

extension HomeScreenRouter: HomeScreenRoutingLogic {
    
    // MARK: Routing
    func routeToRestaurantMenu() {
        guard let viewController = self.viewController else { return }
        let secondVC = RestaurantMenuViewController()
        guard let sourceDataStore = self.dataStore, var destinationDataStore = secondVC.router?.dataStore else { return }
        
        self.passDataToRestaurantMenu(source: sourceDataStore, destination: &destinationDataStore)
        self.navigateToRestaurantMenu(source: viewController, destination: secondVC)
    }
}

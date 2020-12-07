//
//  RestaurantViewControllerMock.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 16.10.2020.
//

import Foundation

@testable import AGLViperProject

final class RestaurantViewControllerMock: RestaurantMenuDisplayLogic {
    
    private(set) var isCalledDisplayRestaurantMenuFetchedData = false
    
    func displayRestaurantMenuFetchedData(viewModel: RestaurantMenuModel.FetchRestaurantMenuData.ViewModel) {
        self.isCalledDisplayRestaurantMenuFetchedData = true
    }
    
    func displayRestaurantMenuChangeControllerMode(viewModel: RestaurantMenuModel.ChangeControllerMode.ViewModel) {
        
    }
    
    func displayRestaurantMenuOpenDetails(viewModel: RestaurantMenuModel.OpenRestaurantMenuDetails.ViewModel) {
        
    }
    
}

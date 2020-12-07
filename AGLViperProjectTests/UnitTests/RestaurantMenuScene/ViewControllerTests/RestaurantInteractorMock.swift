//
//  RestaurantInteractorMock.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 16.10.2020.
//

import Foundation

@testable import AGLViperProject

final class RestaurantInteractorMock: RestaurantMenuBusinessLogic, RestaurantMenuDataStore {
    
    var restaurantMenuData: [HomeScreenData]?
    private(set) var isCalledfetchRestaurantMenuData = false

    func fetchRestaurantMenuData(request: RestaurantMenuModel.FetchRestaurantMenuData.Request) {
        self.isCalledfetchRestaurantMenuData = true
    }
    
    func openRestaurantMenuDetails(request: RestaurantMenuModel.OpenRestaurantMenuDetails.Request) {
        
    }
    
}

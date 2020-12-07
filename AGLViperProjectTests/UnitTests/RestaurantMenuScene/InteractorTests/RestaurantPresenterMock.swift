//
//  RestaurantPresenterMock.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 16.10.2020.
//

import Foundation
@testable import AGLViperProject

final class RestaurantPresenterMock: RestaurantMenuPresentationLogic {
    
    private(set) var isCalledPresentFetchedRestaurantMenuData = false
    
    func presentFetchedRestaurantMenuData(response: RestaurantMenuModel.FetchRestaurantMenuData.Response) {
        self.isCalledPresentFetchedRestaurantMenuData = true
    }
    
    func presentChangeControllerMode(response: RestaurantMenuModel.ChangeControllerMode.Response) {
        
    }
    
    func presentOpenRestaurantMenuDetails(response: RestaurantMenuModel.OpenRestaurantMenuDetails.Response) {
        
    }
}

//
//  RestaurantDetailsPresenterMock.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 20.10.2020.
//

import Foundation
@testable import AGLViperProject

final class RestaurantDetailsPresenterMock: RestaurantDetailsPresentationLogic {
    
    private(set) var isCalledPresentFetchedRestaurantDetailsData = false
    
    func presentRestaurantDetailsControllerMode(response: RestaurantDetailsModel.ChangeControllerMode.Response) {
        
    }
    
    func presentFetchedRestaurantDetailsData(response: RestaurantDetailsModel.FetchRestaurantDetailsData.Response) {
        self.isCalledPresentFetchedRestaurantDetailsData = true
    }
}

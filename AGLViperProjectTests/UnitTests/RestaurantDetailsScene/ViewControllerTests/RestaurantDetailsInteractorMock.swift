//
//  RestaurantDetailsInteractorMock.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 20.10.2020.
//

import Foundation
@testable import AGLViperProject

final class RestaurantDetailsInteractorMock: RestaurantDetailsBusinessLogic, RestaurantDetailsDataStore {
   
    var basket: BasketData?
    
    var option: HomeScreenData?
    private(set) var isCalledfetchRestaurantDetailsData = false
    
    func fetchRestaurantDetailsData(request: RestaurantDetailsModel.FetchRestaurantDetailsData.Request) {
        self.isCalledfetchRestaurantDetailsData = true
    }
    
    func setBasketData(request: RestaurantDetailsModel.SetBasketData.Request) {
        
    }
}

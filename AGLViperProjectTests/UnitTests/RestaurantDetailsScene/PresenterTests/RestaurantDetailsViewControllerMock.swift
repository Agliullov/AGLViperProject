//
//  RestaurantDetailsViewControllerMock.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 20.10.2020.
//

import Foundation
@testable import AGLViperProject

final class RestaurantDetailsViewControllerMock: RestaurantDetailsDisplayLogic {
    
    func displaySetedBasket(viewModel: RestaurantDetailsModel.SetBasketData.ViewModel) {
        
    }
    
    
    private(set) var isCalledDisplayRestaurantDetailsFetchedData = false
    
    func displayRestaurantDetailsControllerMode(viewModel: RestaurantDetailsModel.ChangeControllerMode.ViewModel) {
        
    }
    
    func displayRestaurantDetailsFetchedData(viewModel: RestaurantDetailsModel.FetchRestaurantDetailsData.ViewModel) {
        self.isCalledDisplayRestaurantDetailsFetchedData = true
    }
}

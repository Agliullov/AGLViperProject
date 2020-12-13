//
//  RestaurantPresenterTests.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 16.10.2020.
//

import Foundation
import XCTest

@testable import AGLViperProject

class RestaurantPresenterTests: XCTestCase {
    
    private var presenter: RestaurantMenuPresenter!
    private var viewController: RestaurantViewControllerMock!
    
    private var options: [HomeScreenData] = []
    
    override func setUp() {
        let homePresenter = RestaurantMenuPresenter()
        let homeViewController = RestaurantViewControllerMock()
        homePresenter.viewController = homeViewController
        
        self.presenter = homePresenter
        self.viewController = homeViewController
        
        let option = HomeScreenData(title: "Title2", details: "Details2", imageName: "pizz2", price: 222, priceText: "EUR", header: nil, footer: nil, count: 4)
        self.options.append(option)
    }
    
    override func tearDown() {
        self.presenter = nil
        self.viewController = nil
        
        super.tearDown()
    }
    
    func presentFetchedRestaurantMenuData() {
        //when
        let response = RestaurantMenuModel.FetchRestaurantMenuData.Response(restaurantMenuData: self.options)
        self.presenter.presentFetchedRestaurantMenuData(response: response)
        
        //then
        XCTAssert(self.viewController.isCalledDisplayRestaurantMenuFetchedData, "Not started viewController.presentFetchedRestaurantMenuData")
    }
    
}

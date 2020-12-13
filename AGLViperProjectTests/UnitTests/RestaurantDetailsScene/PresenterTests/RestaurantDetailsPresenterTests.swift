//
//  RestaurantDetailsPresenterTests.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 20.10.2020.
//

import Foundation
import XCTest
@testable import AGLViperProject

class RestaurantDetailsPresenterTests: XCTestCase {
    
    private var presenter: RestaurantDetailsPresenter!
    private var viewController: RestaurantDetailsViewControllerMock!
    
    private var options: HomeScreenData?
    
    override func setUp() {
        let homePresenter = RestaurantDetailsPresenter()
        let homeViewController = RestaurantDetailsViewControllerMock()
        
        homePresenter.viewController = homeViewController
        self.presenter = homePresenter
        self.viewController = homeViewController
        
        let option = HomeScreenData(title: "Title3", details: "Details3", imageName: "pizz3", price: 821, priceText: "RUR", header: nil, footer: nil, count: 3)
        self.options = option
    }
    
    override func tearDown() {
        self.presenter = nil
        self.viewController = nil
        
        super.tearDown()
    }
    
    func presentFetchedRestaurantMenuData() {
        //when
        let response = RestaurantDetailsModel.FetchRestaurantDetailsData.Response(detailsData: self.options)
        self.presenter.presentFetchedRestaurantDetailsData(response: response)
        
        //then
        XCTAssert(self.viewController.isCalledDisplayRestaurantDetailsFetchedData, "Not started viewController.presentFetchedRestaurantMenuData")
    }
}

//
//  RestaurantDetailsInteractorTests.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 20.10.2020.
//

import Foundation
import XCTest
@testable import AGLViperProject

class RestaurantDetailsInteractorTests: XCTestCase {
    
    private var interactor: RestaurantDetailsInteractor!
    private var presenter: RestaurantDetailsPresenterMock!
    
    private var option: HomeScreenData?
    
    override func setUp() {
        let homeInteractor = RestaurantDetailsInteractor()
        let homePresenter = RestaurantDetailsPresenterMock()
        
        homeInteractor.presenter = homePresenter
        self.interactor = homeInteractor
        self.presenter = homePresenter
        
        let option = HomeScreenData(title: "Title", details: "Details", imageName: "pizz1", price: 100, priceText: "RUR", header: nil, footer: nil, count: 1)
        self.option = option
        self.interactor.option = self.option
    }
    
    override func tearDown() {
        self.interactor = nil
        self.presenter = nil
        
        super.tearDown()
    }
    
    func testFetchRestaurantDetailsData() {
        //given
        let request = RestaurantDetailsModel.FetchRestaurantDetailsData.Request()
        self.interactor.fetchRestaurantDetailsData(request: request)
        
        //when
        let interactorMutableOption = self.interactor.getMutableOption()
        
        //then
        XCTAssert(self.presenter.isCalledPresentFetchedRestaurantDetailsData, "Not started presenter.presentFetchedRestaurantMenuData")
        XCTAssertEqual(interactorMutableOption, self.option, "the mutableOption not matchs to option - interactor.fetchRestaurantMenuData")
    }
}

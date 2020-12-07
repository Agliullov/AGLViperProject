//
//  RestaurantInteractorTests.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 16.10.2020.
//

import Foundation
import XCTest
@testable import AGLViperProject

class RestaurantInteractorTests: XCTestCase {
    
    private var interactor: RestaurantMenuInteractor!
    private var presenter: RestaurantPresenterMock!
    
    private var options: [HomeScreenData] = []

    override func setUp() {
        let homeInteractor = RestaurantMenuInteractor()
        let homePresenter = RestaurantPresenterMock()
        
        homeInteractor.presenter = homePresenter
        self.interactor = homeInteractor
        self.presenter = homePresenter
        
        let option = HomeScreenData(title: "Title", description: "Description", imageName: "ImageName", priceText: "Price", header: nil, footer: nil)
        self.options.append(option)
        
        self.interactor.restaurantMenuData = self.options
    }
    
    override func tearDown() {
        self.interactor = nil
        self.presenter = nil
        
        super.tearDown()
    }
    

    func testFetchRestaurantMenuData() {
        //given
        let dbWorkerMock = RestaurantDBWorkerMock()
        self.interactor.setDBWorker(dbWorker: dbWorkerMock)
        
        let request = RestaurantMenuModel.FetchRestaurantMenuData.Request()
        self.interactor.fetchRestaurantMenuData(request: request)
        
        //when
        let interactorMutableOption = self.interactor.getMutableOption()
        
        //then
        XCTAssert(self.presenter.isCalledPresentFetchedRestaurantMenuData, "Not started presenter.presentFetchedRestaurantMenuData")
        XCTAssertEqual(interactorMutableOption, self.options, "the mutableOption not matchs to option - interactor.fetchRestaurantMenuData")
    }
    
}

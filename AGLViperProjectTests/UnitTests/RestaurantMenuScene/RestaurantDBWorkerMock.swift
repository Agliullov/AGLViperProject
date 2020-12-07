//
//  RestaurantDBWorkerMock.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 16.10.2020.
//

import Foundation

@testable import AGLViperProject

class RestaurantDBWorkerMock: RestaurantMenuWorker {
    
    var isGetLocalRestaurantCalled: Bool = false
    
    override func getLocalRestaurantMenuData(completion: @escaping ([HomeScreenData]?) -> Void) {
        self.isGetLocalRestaurantCalled = true
    }

}

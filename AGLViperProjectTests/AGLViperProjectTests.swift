//
//  AGLViperProjectTests.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 30.09.2020.
//

import XCTest
@testable import AGLViperProject

class AGLViperProjectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitHomeScreenData() {
        let data = HomeScreenData(title: "FirstTest", details: "FirstDetailsTest", imageName: "pizzaImage", price: 888, priceText: "TestText", header: nil, footer: nil, count: nil)
        XCTAssertNotNil(data)
    }
    
    func testHomeScreenData() {
        let data = HomeScreenData(title: "123", details: "123", imageName: "123", price: 125, priceText: "123", header: nil, footer: nil, count: nil)
        
        XCTAssertNil(data.header)
        XCTAssertNotNil(data.priceText)
        XCTAssertTrue(data.details == "123")
        XCTAssertEqual(data.title, "123")
    }
}

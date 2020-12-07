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
        let data = HomeScreenData(title: "Foo", description: "Baz", imageName: "image", priceText: "100", header: nil, footer: nil)
        XCTAssertNotNil(data)
    }
    
    func testHomeScreenData() {
        let data = HomeScreenData(title: "123", description: "123", imageName: "123", priceText: "123", header: nil, footer: nil)
        
        XCTAssertNil(data.header)
        XCTAssertNotNil(data.priceText)
        XCTAssertTrue(data.details == "123")
        XCTAssertEqual(data.title, "123")
    }
}

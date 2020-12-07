//
//  AGLViperProjectUITests.swift
//  AGLViperProjectUITests
//
//  Created by Раис Аглиуллов on 30.09.2020.
//

import XCTest

class AGLViperProjectUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testIntroEnter() {
        app.children(matching: .window).element.swipeRight()
        app.children(matching: .window).element.swipeRight()
        app.buttons["Сделать заказ"].tap()
    }
    
    func testRefreshControll() {
        app.buttons["Сделать заказ"].tap()
       // app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeDown()
    }
    
    func testMenuShowDissmiss() {
        app.buttons["Сделать заказ"].tap()
        let menuButton = app.navigationBars["PizzaDelivery.PizzaListVC"].buttons["Menu"]
        menuButton.tap()
        app.buttons["Dismiss"].tap()
    }
    
    func testAddOrder() {
        app.buttons["START ORDER"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        
        let tablesQuery2 = app.tables
        let tablesQuery = tablesQuery2
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["ORDER NOW"]/*[[".cells.buttons[\"ORDER NOW\"]",".buttons[\"ORDER NOW\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2.cells.staticTexts["Mozzarella"].swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["CHECK OUT"]/*[[".cells.buttons[\"CHECK OUT\"]",".buttons[\"CHECK OUT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["HOME"].tap()
    }

    func testExample() throws {
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                app.launch()
            }
        }
    }
}

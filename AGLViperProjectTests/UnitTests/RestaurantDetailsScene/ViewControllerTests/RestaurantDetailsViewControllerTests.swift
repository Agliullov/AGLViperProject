//
//  RestaurantDetailsViewControllerTests.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 20.10.2020.
//

import Foundation
import XCTest
@testable import AGLViperProject

class RestaurantDetailsViewControllerTests: XCTestCase {
    
    private var viewController: RestaurantDetailsViewController!
    private var interactor: RestaurantDetailsInteractorMock!
    
    private var mockCollectionView: RestautantCollectionViewMock!
    private var displayedSections: [RestaurantDetailsModel.DisplayedSection] = []
    
    private var window: UIWindow?
    
    override func setUp() {
        let homeViewController = RestaurantDetailsViewController()
        let homeInteractor = RestaurantDetailsInteractorMock()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let homeCollectionView = RestautantCollectionViewMock(frame: .zero, collectionViewLayout: layout)
        
        homeViewController.interactor = homeInteractor
        
        self.viewController = homeViewController
        self.interactor = homeInteractor
        self.mockCollectionView = homeCollectionView
        self.mockCollectionView.register(RestaurantDetailsView.self, forCellWithReuseIdentifier: String(describing: RestaurantDetailsView.self))
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstCell = RestaurantDetailsModel.DisplayedSection.DisplayedCell(type: .details(title: "FirstTitle", imageName: "FirstSkip", descriptionText: "FirstText", priceText: "FirstPrice", header: nil, footer: nil))
        let secondCell = RestaurantDetailsModel.DisplayedSection.DisplayedCell(type: .details(title: "SecondTitle", imageName: "SecondSkip", descriptionText: "SecondText", priceText: "SecondPrice", header: nil, footer: nil))
        
        let section = RestaurantDetailsModel.DisplayedSection(type: .details, cells: [firstCell, secondCell])
        self.displayedSections.append(section)
    }
    
    private func loadView() {
        self.window?.addSubview(self.viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    override func tearDown() {
        self.viewController = nil
        self.interactor = nil
        self.window = nil
        
        super.tearDown()
    }
    
    func testDisplayFetchedRestaurantDetailsDataWhenViewDidLoad() {
        //when
        self.loadView()
        
        //then
        XCTAssert(self.interactor.isCalledfetchRestaurantDetailsData, "Not started interactor.fetchRestaurantMenuData")
    }
    
    func testCollectionViewNumberOfSection() {
        //given
        self.loadView()
        self.viewController.setSections(sections: self.displayedSections)
        
        //when
        let collectionView = self.viewController.collectionView
        let numberOfSection = collectionView.numberOfSections
        
        //then
        XCTAssertEqual(numberOfSection, self.displayedSections.count, "The number of sections not matches the number of self.sections.count RestaurantMenuViewController")
    }
    
    func testCollectionViewNumberOfItemInSection() {
        //given
        self.loadView()
        self.viewController.setSections(sections: self.displayedSections)
        let sectionNumber: Int = 0
        
        //when
        let collectionView = self.viewController.collectionView
        let numberOfItems = collectionView.numberOfItems(inSection: sectionNumber)
        
        //then
        XCTAssertEqual(numberOfItems, self.displayedSections[sectionNumber].cells.count, "The number of tableViewRows not matches the number of self.sections.cells.count RestaurantMenuViewController")
    }
}


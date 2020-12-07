//
//  RestaurantViewControllerTests.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 16.10.2020.
//

import Foundation
import XCTest
@testable import AGLViperProject

class RestaurantViewControllerTests: XCTestCase {
    
    private var viewController: RestaurantMenuViewController!
    private var interactor: RestaurantInteractorMock!
    
    private var mockCollectionView: RestautantCollectionViewMock!
    private var displayedSections: [RestaurantMenuModel.DisplayedSection] = []

    private var window: UIWindow?
    
    override func setUp() {
        let homeViewController = RestaurantMenuViewController()
        let homeInteractor = RestaurantInteractorMock()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let homeCollectionView = RestautantCollectionViewMock(frame: .zero, collectionViewLayout: layout)
        
        homeViewController.interactor = homeInteractor
        
        self.viewController = homeViewController
        self.interactor = homeInteractor
        self.mockCollectionView = homeCollectionView
        self.mockCollectionView.register(TitleCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: TitleCollectionViewCell.self))
        self.mockCollectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: DetailsCollectionViewCell.self))
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstCell = RestaurantMenuModel.DisplayedSection.DisplayedCell(type: .description(title: "FirstTitle", imageName: "FirstSkip", descriptionText: "FirstText", priceText: "FirstPrice"))
        let secondCell = RestaurantMenuModel.DisplayedSection.DisplayedCell(type: .description(title: "SecondTitle", imageName: "SecondSkip", descriptionText: "SecondText", priceText: "SecondPrice"))
        
        let section = RestaurantMenuModel.DisplayedSection(type: .main, cells: [firstCell, secondCell], header: nil, footer: nil)
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
    
    func testDisplayFetchedRestaurantMenuDataWhenViewDidLoad() {
        //when
        self.loadView()
        
        //then
        XCTAssert(self.interactor.isCalledfetchRestaurantMenuData, "Not started interactor.fetchRestaurantMenuData")
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

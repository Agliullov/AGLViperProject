//
//  RestautantCollectionViewMock.swift
//  AGLViperProjectTests
//
//  Created by Раис Аглиуллов on 16.10.2020.
//

import UIKit

@testable import AGLViperProject

final class RestautantCollectionViewMock: UICollectionView {
    
    private(set) var isReloadDataCalled: Bool = false
    private(set) var isPerformBatchUpdatesCalled: Bool = false
        
    override func reloadData() {
        super.reloadData()
        self.isReloadDataCalled = true
    }
    
    override func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        super.performBatchUpdates(updates, completion: completion)
        self.isPerformBatchUpdatesCalled = true
    }
}


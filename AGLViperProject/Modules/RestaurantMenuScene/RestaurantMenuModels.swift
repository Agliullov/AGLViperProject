//
//  RestaurantMenuModels.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 01.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum RestaurantMenuModel {
    
    struct DisplayedSection: Equatable {
        enum SectionType: Equatable {
            case main
            case details
        }
        
        let type: SectionType
        
        struct DisplayedCell: Equatable {
            enum CellType: Equatable {
                case description(title: String, imageName: String, descriptionText: String, price: Int32, priceText: String)
            }
            
            let type: CellType
        }
        
        let cells: [DisplayedCell]
        let header: String?
        let footer: String?
    }
    
    enum FetchRestaurantMenuData {
        struct Request {
        }
        
        struct Response {
            let restaurantMenuData: [HomeScreenData]
        }
        
        struct ViewModel {
            let displayedSection: [DisplayedSection]
        }
    }
    
    enum OpenRestaurantMenuDetails {
        struct Request {
            let index: Int
        }
        
        struct Response {
            let index: Int
            let restaurantMenuData: HomeScreenData
        }
        
        struct ViewModel {
            let index: Int
            let restaurantMenuData: HomeScreenData
        }
    }
    
    enum ChangeControllerMode {
        struct Request {
        }
        
        struct Response {
            let mode: ControllerMode
        }
        
        struct ViewModel {
            let mode: ControllerMode
        }
    }
}

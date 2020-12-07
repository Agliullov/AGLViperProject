//
//  HomeScreenData.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 30.09.2020.
//

import Foundation

struct HomeScreenData: Codable, Equatable {
    let title: String
    let details: String
    let imageName: String
    let price: Int32
    let priceText: String
    let header: String?
    let footer: String?
    var count: Int32?
    
    init(title: String, details: String, imageName: String, price: Int32, priceText: String, header: String?, footer: String?, count: Int32?) {
        self.title = title
        self.details = details
        self.imageName = imageName
        self.price = price
        self.priceText = priceText
        self.header = header
        self.footer = footer
        self.count = count
    }
}

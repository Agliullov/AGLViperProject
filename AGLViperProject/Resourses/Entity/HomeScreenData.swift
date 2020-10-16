//
//  HomeScreenData.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 30.09.2020.
//

import Foundation

struct HomeScreenData: Codable {
    let title: String
    let description: String
    let imageName: String
    let priceText: String
    let header: String?
    let footer: String?
}

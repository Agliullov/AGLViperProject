//
//  BasketData.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 11.11.2020.
//

import Foundation

class BasketData: NSObject, NSCoding {
    
    var price: Int32 = 0
    var title: String = ""
    var imageName: String = ""
    var details: String = ""
    var count: Int32 = 0
    
    init(price: Int32, title: String? = nil, imageName: String? = nil, details: String? = nil, count: Int32) {
        self.price = price
        self.title = title ?? ""
        self.imageName = imageName ?? ""
        self.details = details ?? ""
        self.count = count
    }
    
    required convenience init?(coder: NSCoder) {
        let price = coder.decodeInt32(forKey: "price")
        let title = coder.decodeObject(forKey: "title") as? String
        let imageName = coder.decodeObject(forKey: "imageName") as? String
        let details = coder.decodeObject(forKey: "details") as? String
        let count = coder.decodeInt32(forKey: "count")
        
        self.init(price: price, title: title, imageName: imageName, details: details, count: count)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.price, forKey: "price")
        coder.encode(self.title, forKey: "title")
        coder.encode(self.imageName, forKey: "imageName")
        coder.encode(self.details, forKey: "details")
        coder.encode(self.count, forKey: "count")
    }
}

//
//  DataSource.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 01.11.2020.
//

import Foundation

let BASKET_OBJECT_FOR_USER_DEFAULTS: String = "BASKET_OBJECT_FOR_USER_DEFAULTS"

class DataSource: NSObject {
    
    static let shared: DataSource = DataSource()
    
    func setBasketObject(_ value: BasketData) {
        var arrayObject: [BasketData] = []
        
        if let data = UserDefaults.standard.object(forKey: BASKET_OBJECT_FOR_USER_DEFAULTS) as? Data
        {
            var dataItems = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [BasketData]
            dataItems?.append(value)
            arrayObject = dataItems ?? []
        } else {
            arrayObject.append(value)
        }
        
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: arrayObject, requiringSecureCoding: false) else { return }
        
        UserDefaults.standard.setValue(data, forKey: BASKET_OBJECT_FOR_USER_DEFAULTS)
    }
    
    func getBasketObject() -> [BasketData] {
        if let data = UserDefaults.standard.object(forKey: BASKET_OBJECT_FOR_USER_DEFAULTS) as? Data
        {
            let dataItems = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [BasketData]
            return dataItems ?? []
        }
        return []
    }
    
    func clearBasketObject() {
        UserDefaults.standard.removeObject(forKey: BASKET_OBJECT_FOR_USER_DEFAULTS)
    }
}

//
//  ColorHelper.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 11.11.2020.
//

import UIKit

class ColorHelper {
    
    static let shared: ColorHelper = ColorHelper()
    
    func titleTextAttribute() -> [NSAttributedString.Key : NSObject] {
        UINavigationBar.appearance().barTintColor = UIColor.green
        let textColorAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 21.0), NSAttributedString.Key.foregroundColor: UIColor.white]
        return textColorAttribute
    }
}

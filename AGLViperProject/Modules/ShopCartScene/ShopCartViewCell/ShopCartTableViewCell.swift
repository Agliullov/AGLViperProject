//
//  ShopCartTableViewCell.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 14.10.2020.
//

import UIKit

class ShopCartTableViewCell: UITableViewCell {
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        
    }
    
    func setupValue(titleText: String, priceText: String) {
        
    }
}

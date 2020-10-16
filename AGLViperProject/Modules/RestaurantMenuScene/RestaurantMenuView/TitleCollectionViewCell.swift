//
//  TitleCollectionViewCell.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 01.10.2020.
//

import UIKit

class TitleCollectionViewCell: UICollectionReusableView {
    
    private let headerTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    fileprivate func initialSetup(){
        self.addSubview(headerTextLabel)
        
        let constraints: [NSLayoutConstraint] = [
            headerTextLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            headerTextLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 4),
            self.rightAnchor.constraint(equalTo: headerTextLabel.rightAnchor),
            self.layoutMarginsGuide.bottomAnchor.constraint(equalTo: headerTextLabel.bottomAnchor, constant: -4)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setup(headerText: String) {
        headerTextLabel.text = headerText
    }
}

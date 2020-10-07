//
//  TitleCollectionViewCell.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 01.10.2020.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    private let headerTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetup()
    }
    
    fileprivate func initSetup(){
        self.addSubview(headerTextLabel)
        
        let constraints: [NSLayoutConstraint] = [
            headerTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            headerTextLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 4),
            contentView.rightAnchor.constraint(equalTo: headerTextLabel.rightAnchor),
            contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: headerTextLabel.bottomAnchor, constant: -4)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setup(headerText: String) {
        headerTextLabel.text = headerText
    }
}

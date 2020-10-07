//
//  DetailsCollectionViewCell.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 01.10.2020.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    private let screenFrame: CGSize = UIScreen.main.bounds.size
    
    private let centerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = UIColor.black
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
    
    fileprivate func initSetup() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(centerImage)
        contentView.addSubview(descriptionLabel)
        
        let constraints: [NSLayoutConstraint] = [
            centerImage.heightAnchor.constraint(equalToConstant: screenFrame.height / 5),
            centerImage.widthAnchor.constraint(equalToConstant: screenFrame.width / 2.2),
            centerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            centerImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: centerImage.rightAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: centerImage.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: +10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupValue(descriptionText: String, imageName: String) {
        if let image = UIImage(named: imageName) {
            centerImage.image = image
        }
        descriptionLabel.text = descriptionText
    }
    
}

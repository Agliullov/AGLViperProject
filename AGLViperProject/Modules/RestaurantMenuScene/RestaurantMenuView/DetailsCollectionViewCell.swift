//
//  DetailsCollectionViewCell.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 01.10.2020.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    private let screenFrame: CGSize = UIScreen.main.bounds.size
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 19.0)
        label.textColor = UIColor.black
        return label
    }()
    
    private let centerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = UIColor.black
        label.numberOfLines = 2
        return label
    }()
    
    private let priceLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 17.0)
        title.textAlignment = .center
        title.numberOfLines = 1
        return title
    }()
    
    private let priceTextLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 17.0)
        title.textAlignment = .center
        title.numberOfLines = 1
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    fileprivate func initialSetup() {
        contentView.backgroundColor = UIColor.white
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(centerImage)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(priceTextLabel)
        
        let constraints: [NSLayoutConstraint] = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 4.0),
            
            centerImage.heightAnchor.constraint(equalToConstant: screenFrame.height / 2),
            centerImage.widthAnchor.constraint(equalToConstant: screenFrame.width),
            centerImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4.0),
            centerImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: centerImage.rightAnchor, constant: 4.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: centerImage.bottomAnchor, constant: 4.0),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 4.0),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8.0),
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4.0),
            
            priceTextLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8.0),
            priceTextLabel.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: priceTextLabel.rightAnchor, constant: 4.0),
            contentView.bottomAnchor.constraint(equalTo: priceTextLabel.bottomAnchor, constant: 4.0)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupValue(titleText: String, imageName: String, descriptionText: String, price: Int32, priceText: String) {
        titleLabel.text = titleText
        
        if let image = UIImage(named: imageName) {
            centerImage.image = image
        }
        descriptionLabel.text = descriptionText
        
        priceLabel.text = "\(price)"
        
        priceTextLabel.text = priceText
        
    }
}

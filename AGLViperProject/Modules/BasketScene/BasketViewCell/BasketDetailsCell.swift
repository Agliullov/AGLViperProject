//
//  BasketDetailsCell.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 01.11.2020.
//

import UIKit

class BasketDetailsCell: UITableViewCell {
    
    private let mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.contentMode = .scaleAspectFit
        return mainImage
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22.0)
        return label
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor.gray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17.0)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(mainImage)
        contentView.addSubview(detailsLabel)
        contentView.addSubview(priceLabel)
        
        let constraints: [NSLayoutConstraint] = [
            
            mainImage.heightAnchor.constraint(equalToConstant: 90.0),
            mainImage.widthAnchor.constraint(equalToConstant: 90.0),
            mainImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainImage.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 4.0),
            nameLabel.leftAnchor.constraint(equalTo: mainImage.rightAnchor, constant: 8.0),
            contentView.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 8.0),
            
            detailsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4.0),
            detailsLabel.leftAnchor.constraint(equalTo: mainImage.rightAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: detailsLabel.rightAnchor, constant: 8.0),
            
            priceLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 4.0),
            priceLabel.leftAnchor.constraint(equalTo: mainImage.rightAnchor, constant: 8.0),
            contentView.rightAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 8.0),
            contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8.0)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setup(imageName: String?, name: String?, details: String?, price: Int32?) {
        nameLabel.text = name
        detailsLabel.text = details
        priceLabel.text = "\(price ?? 0)"
        
        if let imageName = imageName {
            mainImage.image = UIImage(named: imageName)
        }
        
        setNeedsLayout()
    }
}


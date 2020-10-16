//
//  RestaurantDetailsView.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 09.10.2020.
//

import UIKit

class RestaurantDetailsView: UICollectionViewCell {
    
    private let screenFrame: CGSize = UIScreen.main.bounds.size
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 21.0)
        title.textAlignment = .center
        return title
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 17.0)
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    private let headerLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .red
        title.font = UIFont.systemFont(ofSize: 17.0)
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    private let footerLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .red
        title.font = UIFont.systemFont(ofSize: 17.0)
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
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
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7.0
        button.clipsToBounds = true
        button.backgroundColor = UIColor.gray
        button.tintColor = .white
        button.setTitle("В корзину", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetup()
    }
    
    private func initSetup() {
        contentView.backgroundColor = UIColor.white
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(footerLabel)
        contentView.addSubview(orderButton)
        contentView.addSubview(priceLabel)
        
        orderButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let constraints: [NSLayoutConstraint] = [
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            headerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: headerLabel.rightAnchor, constant: 4.0),
            
            footerLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8.0),
            footerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: footerLabel.rightAnchor, constant: 4.0),
            
            priceLabel.topAnchor.constraint(equalTo: footerLabel.bottomAnchor, constant: 8.0),
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 4.0),
            
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8.0),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 4.0),
            
            mainImageView.heightAnchor.constraint(equalToConstant: screenFrame.height / 2),
            mainImageView.widthAnchor.constraint(equalToConstant: screenFrame.width),
            mainImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            mainImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: mainImageView.rightAnchor, constant: 4.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 8.0),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            contentView.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 4.0),
            
            orderButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4.0),
            orderButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0),
            contentView.rightAnchor.constraint(equalTo: orderButton.rightAnchor, constant: 15.0),
            contentView.bottomAnchor.constraint(equalTo: orderButton.bottomAnchor, constant: 4.0),
            orderButton.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupValue(titleText: String, imageName: String, descriptionText: String, priceText: String, headerText: String?, footerText: String?) {
        
        titleLabel.text = titleText
        
        priceLabel.text = priceText
        
        if let image = UIImage(named: imageName) {
            mainImageView.image = image
        }
        
        descriptionLabel.text = descriptionText
        
        guard let header = headerText else { return }
        headerLabel.text = header
        
        guard let footer = footerText else { return }
        footerLabel.text = footer
    }
    
    @objc private func buttonAction() {
        
    }
}

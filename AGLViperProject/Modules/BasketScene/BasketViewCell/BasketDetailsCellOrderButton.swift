//
//  BasketDetailsCellOrderButton.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 12.12.2020.
//

import UIKit

class BasketDetailsCellOrderButton: UITableViewCell {
    
    var orderButtonHandler: (()->())?
    
    private let orderButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Оплатить", for: .normal)
        button.layer.cornerRadius = 7.0
        button.clipsToBounds = true
        button.backgroundColor = UIColor.gray
        button.tintColor = .white
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        contentView.addSubview(orderButton)
        contentView.backgroundColor = .clear
        orderButton.addTarget(self, action: #selector(orderButtonDidTapped), for: .touchUpInside)
        
        let constraints: [NSLayoutConstraint] = [
            orderButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            orderButton.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            contentView.layoutMarginsGuide.rightAnchor.constraint(equalTo: orderButton.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: orderButton.bottomAnchor, constant: 8.0)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func orderButtonDidTapped() {
        self.orderButtonHandler?()
    }
}

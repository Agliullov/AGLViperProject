//
//  SecondSplashScreenPage.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 06.10.2020.
//

import UIKit

class SecondSplashScreenPage: UIViewController {
    
    private let imageCenter: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "backgroundPizza2")
        return image
    }()
    
    private let labelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25.0)
        label.textColor = UIColor.white
        label.text = "Самая вкусная пицца у нас!"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageCenter)
        view.addSubview(labelText)
        
        let constraints: [NSLayoutConstraint] = [
            labelText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0),
            view.rightAnchor.constraint(equalTo: labelText.rightAnchor, constant: 15.0),
            view.bottomAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 80.0),
            imageCenter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

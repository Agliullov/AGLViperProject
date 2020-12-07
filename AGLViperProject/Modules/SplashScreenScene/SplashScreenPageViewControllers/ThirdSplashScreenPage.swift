//
//  ThirdSplashScreenPage.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 06.10.2020.
//

import UIKit

class ThirdSplashScreenPage: UIViewController {
    
    var buttonHandler: (() -> Void)?
    
    private let imageCenter: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "backgroundPizza3")
        return image
    }()
    
    private let buttonNext: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7.0
        button.clipsToBounds = true
        button.backgroundColor = UIColor.gray
        button.tintColor = .white
        button.setTitle("Вперед", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageCenter)
        view.addSubview(buttonNext)
        
        buttonNext.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        let constraints: [NSLayoutConstraint] = [
            buttonNext.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 15.0),
            view.layoutMarginsGuide.rightAnchor.constraint(equalTo: buttonNext.rightAnchor, constant: 15.0),
            view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: buttonNext.bottomAnchor, constant: 80.0),
            buttonNext.heightAnchor.constraint(equalToConstant: 50.0),
            imageCenter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func buttonDidTap() {
        self.buttonHandler?()
        let mainVC = HomeScreenViewController()
        UserDefaults.standard.setValue(true, forKey: "launchedBefore")
        navigationController?.pushViewController(mainVC, animated: true)
    }
}

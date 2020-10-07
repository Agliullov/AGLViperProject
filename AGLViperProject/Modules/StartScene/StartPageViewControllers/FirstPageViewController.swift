//
//  FirstPageViewController.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 06.10.2020.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    private let imageCenter: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        image.image = UIImage(named: "back1.png")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageCenter)
        
        let constraints: [NSLayoutConstraint] = [
            imageCenter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}

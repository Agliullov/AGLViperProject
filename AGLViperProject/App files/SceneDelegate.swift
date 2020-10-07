//
//  SceneDelegate.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 30.09.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let launchedBefore = UserDefaults.standard.object(forKey: "launchedBefore")
        if launchedBefore == nil {
            let startVC = StartPageViewController()
            UserDefaults.standard.setValue(true, forKey: "launchedBefore")
            let navigationController = UINavigationController(rootViewController: startVC)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        } else {
            let mainVC = FirstViewController()
            let navigationController = UINavigationController(rootViewController: mainVC)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
}

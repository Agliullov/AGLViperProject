//
//  SplashScreenPageViewController.swift
//  AGLViperProject
//
//  Created by Раис Аглиуллов on 05.10.2020.
//

import UIKit

class SplashScreenPageViewController: UIPageViewController {
    
    fileprivate var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 100, y: UIScreen.main.bounds.size.height - 44.0 - 20, width: 200.0, height: 20.0))
        pageControl.pageIndicatorTintColor = UIColor.secondaryLabel
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.hidesForSinglePage = true
        return pageControl
    }()
    
    var pageController: UIPageViewController!
    var controllers = [UIViewController]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        addChild(pageController)
        view.addSubview(pageController.view)
        
        let views = ["pageController": pageController.view] as [String: AnyObject]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageController]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageController]|", options: [], metrics: nil, views: views))
        
        controllers.append(FirstSplashScreenPage())
        controllers.append(SecondSplashScreenPage())
        controllers.append(ThirdSplashScreenPage())
        
        pageController.setViewControllers([controllers[0]], direction: .forward, animated: false, completion: nil)
        
        self.view.addSubview(self.pageControl)
        self.pageControl.numberOfPages = self.controllers.count        
    }
    
}

extension SplashScreenPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            } else {
                return nil
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            } else {
                return nil
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let firstVC = pageViewController.viewControllers?.first, let index = self.controllers.firstIndex(of: firstVC) {
                self.pageControl.currentPage = index
            }
        }
    }
    
}

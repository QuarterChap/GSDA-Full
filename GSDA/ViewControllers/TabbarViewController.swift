//
//  TabbarViewController.swift
//  GSDA
//
//  Created by Joriah Lasater on 3/7/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import UIKit

final class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbars = createTabBars()
        tabBar.tintColor = .white
        tabBar.barTintColor = .myBlue
        
        tabBar.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.5)
        tabBar.backgroundColor = .black
        viewControllers = tabbars
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Api.User.CURRENT_USER == nil {
            present(LoginViewController(), animated: true, completion: nil)
        }
    }
    
    let homeViewController = HomeViewController()
    let schoolViewController = SchoolMaterialViewController()
    let settingsViewController = AccountSettingsViewController()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tabBar.invalidateIntrinsicContentSize()
    }
    
    func createTabBars() -> [UIViewController] {
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem.title = "HOME"
        homeNavigationController.tabBarItem.image = UIImage(named: "home")
        
        
        let schoolNavigationController = UINavigationController(rootViewController: schoolViewController)
        schoolNavigationController.tabBarItem.title = "SCHOOL MATERIAL"
        schoolNavigationController.tabBarItem.image = UIImage(named: "school")
        
        let settingNavigationController = UINavigationController(rootViewController: settingsViewController)
        settingNavigationController.tabBarItem.title = "SETTINGS"
        settingNavigationController.tabBarItem.image = UIImage(named: "settings")
        
        
        let VCs = [homeNavigationController, schoolNavigationController, settingNavigationController]
        
        VCs.forEach {
            $0.navigationBar.barTintColor = .myBlue
            $0.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            $0.navigationBar.tintColor = .white
        }
        
        return VCs
    }
}

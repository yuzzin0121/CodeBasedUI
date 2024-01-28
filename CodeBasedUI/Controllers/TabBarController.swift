//
//  TabBarController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        addViewController()
    }
    
    private func addViewController() {
        let mainVC = MainViewController()
        let mainNav = UINavigationController(rootViewController: mainVC)
        
        mainVC.title = "홈"
        mainNav.tabBarItem = UITabBarItem(title: TabItem.home.rawValue, image: TabItem.home.image, selectedImage: TabItem.home.selectedImage)
        
        let searchVC = SearchViewController()
        let searchNav = UINavigationController(rootViewController: searchVC)

        searchVC.title = TabItem.search.rawValue
        searchNav.tabBarItem = UITabBarItem(title: TabItem.search.rawValue, image: TabItem.search.image, selectedImage: TabItem.search.selectedImage)
        
        let savedListVC = SavedListViewController()
        let savedListNav = UINavigationController(rootViewController: savedListVC)

        savedListVC.title = TabItem.list.rawValue
        savedListNav.tabBarItem = UITabBarItem(title: TabItem.list.rawValue, image: TabItem.list.image, selectedImage: TabItem.list.selectedImage)
        
        [mainNav, searchNav, savedListNav].forEach {
            $0.setupBarAppearance()
        }
        
        self.viewControllers = [mainNav, searchNav, savedListNav]
    }
   

}

//
//  TabBarController.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 19/10/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        
        let viewOne = UINavigationController(rootViewController: MainScreenController())
        let viewTwo = UINavigationController(rootViewController: FavoritesController())
        
        viewOne.tabBarItem.image = UIImage(systemName: "play.fill")
        viewTwo.tabBarItem.image = UIImage(systemName: "heart.fill")
        
        viewOne.title = "Activities"
        viewTwo.title = "Favorites"
        
        tabBar.isOpaque = false
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .black
        
        setViewControllers([viewOne, viewTwo], animated: false)
        selectedIndex = 1
    }
    
}

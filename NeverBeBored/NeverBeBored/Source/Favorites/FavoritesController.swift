//
//  FavoritesController.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 19/10/22.
//

import UIKit

class FavoritesController: UIViewController {
    
    let favoritesView = FavoritesView()
    
    override func loadView() {
        title = "Favorites"
        view = favoritesView
    }
}

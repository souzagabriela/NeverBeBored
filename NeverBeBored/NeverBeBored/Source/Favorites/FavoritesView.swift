//
//  FavoritesView.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 19/10/22.
//

import UIKit

class FavoritesView: UIView {
    
    let background = make(UIImageView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "backgroundImage")
        $0.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesView: ViewCoding {
    func setupView() {
        addSubview(background)
        
    }
    
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    
}

//
//  MainScreenView.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 17/10/22.
//

import UIKit

class MainScreenView: UIView {
    let catImage = make(UIImageView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "catTwo")
        $0.contentMode = .scaleAspectFit
    }
    let card = make(UIView(frame: .zero)) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(named: "cardYellow")
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 10
        $0.layer.cornerRadius = 22
    }

    let labelActivity = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .black
    }

    let labelDescription = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 17, weight: .regular)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    
    lazy var buttonDoIt = make(UIButton()) {
        $0.configuration = .borderedProminent()
        $0.setTitle("Generate Activity", for: .normal)
        $0.backgroundColor = UIColor(named: "cardPink")
        $0.addTarget(self, action: #selector(buttonClicked(_ :)),
                     for: .touchUpInside)
    
    }

    lazy var buttonFilters = make(UIButton()) {
        $0.configuration = .borderedProminent()
        $0.setTitle("Categories", for: .normal)
        $0.backgroundColor = UIColor(named: "cardOrange")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClicked(_ : UIButton) {
        print("just testing!")
    }

}

extension MainScreenView: ViewCoding {
    func setupView() {
        backgroundColor = .white
    }

    func setupHierarchy() {
        self.addSubview(catImage)
        self.addSubview(card)
        self.addSubview(labelActivity)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            catImage.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -180),
            catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -100),
            catImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    
            card.topAnchor.constraint(equalTo: catImage.topAnchor, constant: 180),
            card.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            card.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            card.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            card.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
            labelActivity.topAnchor.constraint(equalTo: card.bottomAnchor),
            labelActivity.bottomAnchor.constraint(equalTo: card.bottomAnchor),
            labelActivity.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),
            labelActivity.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -10)
        ])
    }

}

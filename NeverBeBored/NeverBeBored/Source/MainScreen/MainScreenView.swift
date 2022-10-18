//
//  MainScreenView.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 17/10/22.
//

import UIKit

class MainScreenView: UIView {
    
    lazy var stack = make(UIStackView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 20
        $0.addArrangedSubview(self.buttonDoIt)
        $0.addArrangedSubview(self.buttonChooseAnother)
    }
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
    
    let info = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .black
    }

    lazy var buttonDoIt = make(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.textColor = .white
        $0.configuration = .bordered()
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 10
        $0.setTitle("Generate Activity", for: .normal)
        $0.backgroundColor = UIColor(named: "cardOrange")
        $0.addTarget(self, action: #selector(buttonClicked(_ :)),
                     for: .primaryActionTriggered)
    }

    lazy var buttonChooseAnother = make(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.textColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 10
        $0.configuration = .bordered()
        $0.setTitle("Choose another", for: .normal)
        $0.backgroundColor = UIColor(named: "cardOrange")
        $0.addTarget(self, action: #selector(chooseAnother(_ :)),
                     for: .primaryActionTriggered)
    }

//    func set(boredInfo: BoredInfo) {
//        labelActivity.text = boredInfo.activity
//    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonClicked(_: UIButton) {
        print("just testing!")
    }

    @objc func chooseAnother(_: UIButton) {
        print("another test but with a different button")
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
        self.addSubview(info)
        self.addSubview(labelDescription)
        self.addSubview(stack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            catImage.bottomAnchor.constraint(equalTo: card.topAnchor),
            catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            catImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),

            card.topAnchor.constraint(equalTo: catImage.bottomAnchor),
            card.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            card.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            card.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
//            card.bottomAnchor.constraint(equalTo: labelDescription.bottomAnchor),

            labelActivity.topAnchor.constraint(equalTo: card.centerYAnchor, constant: -60),
            labelActivity.bottomAnchor.constraint(equalTo: info.topAnchor),
            labelActivity.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),
            labelActivity.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -10),

            info.topAnchor.constraint(equalTo: card.centerYAnchor),
            info.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),

            labelDescription.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 5),
            labelDescription.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),
        
            stack.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 50),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50)
        ])
    }

}

//
//  MainScreenView.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 14/10/22.
//

import UIKit

protocol OnboardingScreenDelegate: AnyObject {
    func onboardingScreenView(_ mainScreenView: OnboardingScreenView, didTapOnButton button: UIButton)
}

class OnboardingScreenView: UIView {

    weak var delegate: OnboardingScreenDelegate?

    private let catImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "catOne")
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let cardView: UIView = {
        let card = UIView(frame: .zero)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(named: "cardGreen")
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.3
        card.layer.shadowRadius = 10
        card.layer.cornerRadius = 22
        return card
    }()
    let label = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .black
    }

    lazy var buttonDoIt = make(UIButton()) {
        $0.configuration = .borderedProminent()
        $0.setTitle("Generate Activity", for: .normal)
        $0.backgroundColor = UIColor(named: "cardPink")
    
    }

    lazy var buttonCategories = make(UIButton()) {
        $0.configuration = .borderedProminent()
        $0.setTitle("Categories", for: .normal)
        $0.backgroundColor = UIColor(named: "cardOrange")
    }

    lazy var buttonGetStarted = make(UIButton()) {
        $0.configuration = .borderedTinted()
        $0.backgroundColor = UIColor(named: "cardOrange")
        $0.setTitle("Get started", for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "backgroundColor")
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    @objc private func action(sender: UIButton) {
//        delegate?.mainScreenView(self, didTapOnButton: sender)
//        didTapOnButtonHandler?()
//    }
}

extension OnboardingScreenView: ViewCoding {
    func setupView() {
        backgroundColor = .white

    }
    
    func setupHierarchy() {
        self.addSubview(catImage)
        self.addSubview(cardView)
        self.addSubview(label)
//        self.addSubview(buttonGetStarted)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            catImage.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -180),
            catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -100),
            catImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            cardView.topAnchor.constraint(equalTo: catImage.topAnchor, constant: 180),
            cardView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            cardView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            cardView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            cardView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            label.topAnchor.constraint(equalTo: cardView.topAnchor),
            label.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10)
        ])
    }
}

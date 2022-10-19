//
//  MainScreenView.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 14/10/22.
//

import UIKit

//protocol OnboardingScreenDelegate: AnyObject {
//    func onboardingScreenView(_ mainScreenView: OnboardingScreenView, didTapOnButton button: UIButton)
//}

class OnboardingScreenView: UIView {

    var didTapOnButton: (() -> Void)?
//    weak var delegate: OnboardingScreenDelegate?

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

    lazy var buttonGetStarted = make(UIButton()) {
//        $0.configuration = .borderedTinted()
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.textColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 10
        $0.backgroundColor = UIColor(named: "cardOrange")
        $0.setTitle("Get started", for: .normal)
        $0.addTarget(self, action: #selector(buttonStarted(_ :)), for: .primaryActionTriggered)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "backgroundColor")
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonStarted(_: UIButton) {
        didTapOnButton?()
//        let rootMain = OnboradingViewController()
//        let navigationOnboarding = UINavigationController(rootViewController: rootMain)
//        navigationOnboarding.pushViewController(MainScreenController(), animated: true)
    }
}

extension OnboardingScreenView: ViewCoding {
    func setupView() {
        backgroundColor = .white

    }
    func setupHierarchy() {
        self.addSubview(catImage)
        self.addSubview(cardView)
        self.addSubview(label)
        self.addSubview(buttonGetStarted)
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
            label.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            
            buttonGetStarted.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 100),
            buttonGetStarted.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonGetStarted.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonGetStarted.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.08),
            buttonGetStarted.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.55)
        ])
    }
}

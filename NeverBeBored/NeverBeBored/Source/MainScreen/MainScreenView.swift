//
//  MainScreenView.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 17/10/22.
//

import UIKit

class MainScreenView: UIView {

    var didTapFavorites: (() -> Void)?
    var didReaload: (() -> Void)?

    lazy var stack = make(UIStackView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 20
        $0.addArrangedSubview(self.buttonDoIt)
        $0.addArrangedSubview(self.buttonChooseAnother)
    }

    lazy var stackFilter = make(UIStackView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 20
        $0.addArrangedSubview(self.labelFilter)
        $0.addArrangedSubview(self.buttonFilters)
    }

    let background = make(UIImageView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "backgroundImage")
        $0.contentMode = .scaleAspectFit
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

    let labelType = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .black
    }

    let labelParticipants = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .black
    }

    let info = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 17, weight: .heavy)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .black
    }

    lazy var buttonDoIt = make(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.configuration = .bordered()
        $0.layer.cornerRadius = 10
        $0.setTitle("  Favorite", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.textColor = .white
        let largeFont = UIFont.systemFont(ofSize: 16)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        var heartImage = UIImage(systemName: "heart.fill", withConfiguration: configuration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        $0.setImage(heartImage, for: .normal)
        $0.backgroundColor = UIColor(named: "cardOrange")
        $0.addTarget(self, action: #selector(buttonClicked(_ :)),
                     for: .primaryActionTriggered)
    }

    lazy var buttonChooseAnother = make(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.configuration = .bordered()
        $0.setTitleColor(.white, for: .normal)
        let largeFont = UIFont.systemFont(ofSize: 16)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        var heartImage = UIImage(
            systemName: "gobackward",
            withConfiguration: configuration
        )?.withTintColor(.white, renderingMode: .alwaysOriginal)
        $0.setImage(heartImage, for: .normal)
        $0.setTitle("  Other", for: .normal)
        $0.backgroundColor = UIColor(named: "cardOrange")
        $0.titleLabel?.textColor = .white
        $0.addTarget(self, action: #selector(chooseAnother(_ :)),
                     for: .touchUpInside)
    }

    let labelFilter = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = true
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .black
    }

    lazy var buttonFilters = make(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowRadius = 10
        $0.configuration = .bordered()
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("Filters", for: .normal)
        $0.backgroundColor = UIColor(named: "cardPink")
        $0.addTarget(self, action: #selector(buttonFilters(_:)),
                     for: .touchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonClicked(_: UIButton) {
        didTapFavorites?()
    }

    @objc func chooseAnother(_: UIButton) {
        didReaload?()
    }

    @objc func buttonFilters(_: UIButton) {
        print("another test for filters")
    }

}

extension MainScreenView: ViewCoding {
    func setupView() {
        addSubview(background)
    }

    func setupHierarchy() {
        self.addSubview(catImage)
        self.addSubview(card)
        self.addSubview(labelActivity)
        self.addSubview(info)
        self.addSubview(labelType)
        self.addSubview(labelParticipants)
        self.addSubview(stack)
        self.addSubview(stackFilter)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            catImage.bottomAnchor.constraint(equalTo: card.topAnchor),
            catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            catImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),

            card.topAnchor.constraint(equalTo: catImage.bottomAnchor),
            card.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            card.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            card.bottomAnchor.constraint(equalTo: labelParticipants.bottomAnchor, constant: 20),

            labelActivity.topAnchor.constraint(equalTo: card.centerYAnchor, constant: -60),
            labelActivity.bottomAnchor.constraint(equalTo: info.topAnchor),
            labelActivity.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),
            labelActivity.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -10),

            info.topAnchor.constraint(equalTo: card.centerYAnchor),
            info.topAnchor.constraint(equalTo: labelActivity.bottomAnchor),
            info.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),

            labelType.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 5),
            labelType.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),
            labelParticipants.topAnchor.constraint(equalTo: labelType.bottomAnchor, constant: 2),
            labelParticipants.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10),

            stack.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 50),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),

            stackFilter.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 100),
            stackFilter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            stackFilter.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
}

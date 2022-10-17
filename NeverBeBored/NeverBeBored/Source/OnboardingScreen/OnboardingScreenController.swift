//
//  Main.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 13/10/22.
//

import UIKit
class OnboradingViewController: UIViewController {
    
    let onboardingScreenView = OnboardingScreenView()
    var onboardingScreenModel = OnboardingScreenModel() {
        didSet {
            onboardingScreenView.label.text = onboardingScreenModel.textMainScreen.description
        }
    }
    
    override func loadView() {
        view = onboardingScreenView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingScreenView.label.text = onboardingScreenModel.textMainScreen.description
    }
}

//
//  Main.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 13/10/22.
//

import UIKit
class OnboradingViewController: UIViewController {
    
    let mainScreenView = OnboardingScreenView()
    var mainScreenModel = OnboardingScreenModel() {
        didSet {
            mainScreenView.label.text = mainScreenModel.textMainScreen.description
        }
    }
    
    override func loadView() {
        view = mainScreenView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenView.label.text = mainScreenModel.textMainScreen.description
    }
}


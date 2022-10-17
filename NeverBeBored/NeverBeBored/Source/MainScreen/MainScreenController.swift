//
//  MainScreenController.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 17/10/22.
//

import UIKit

class MainScreenController: UIViewController {

    let mainScreenView = MainScreenView()
    var mainScreenModel = MainScreenModel() {
        didSet {
            mainScreenView.labelActivity.text = mainScreenModel.randomAction.description
        }
    }

    override func loadView() {
        view = mainScreenView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenView.labelActivity.text = mainScreenModel.randomAction.description
    }
}

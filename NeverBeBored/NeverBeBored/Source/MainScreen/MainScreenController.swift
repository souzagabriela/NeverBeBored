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
            DispatchQueue.main.async {
                self.mainScreenView.labelActivity.text = self.mainScreenModel.activities.randomElement()?.activity
                self.mainScreenView.info.text = self.mainScreenModel.infoActivities.description
                self.mainScreenView.labelDescription.text = self.mainScreenModel.activities.randomElement()?.type
//                self.mainScreenView.info.text = self.mainScreenModel.infoActivities.description
            }
        }
    }
    override func loadView() {
        view = mainScreenView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "Activities"
        fetch()
    }
    func fetch() {
        URLSession.shared.request(
            url: Url.baseUrl,
            expecting: BoredInfo.self
        ) { [weak self] result in
            switch result {
            case .success(let bored):
                self?.mainScreenModel.activities = [bored]
            case.failure(let error):
                print(error)
            }
        }
    }
}

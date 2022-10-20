//
//  MainScreenController.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 17/10/22.
//

import UIKit

class MainScreenController: UIViewController {

//    let buttonForMainScreen = ButtonForMainScreen()
    let mainScreenView = MainScreenView()
    var mainScreenModel = MainScreenModel() {
        didSet {
            DispatchQueue.main.async {
                self.mainScreenView.labelActivity.text = "\(self.mainScreenModel.activities.randomElement()?.activity ?? "0")"
                self.mainScreenView.info.text = self.mainScreenModel.infoActivities.description
                self.mainScreenView.labelType.text = "Type: \(self.mainScreenModel.activities.randomElement()?.type ?? "0")"
                self.mainScreenView.labelParticipants.text = "Nº of participants: \(self.mainScreenModel.activities.randomElement()?.participants ?? 0)"
                self.mainScreenView.labelFilter.text = self.mainScreenModel.infoFilters.description
            }
        }
    }
    override func loadView() {
//        view = buttonForMainScreen
        view = mainScreenView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        mainScreenView.didTapFavorites = { [weak self] in
            self?.navigationController?.pushViewController(FavoritesController(), animated: true)
        }
        mainScreenView.didReaload = { [weak self] in
            self?.fetch()
        }
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

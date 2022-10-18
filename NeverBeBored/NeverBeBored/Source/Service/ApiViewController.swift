//
//  ViewController.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 10/10/22.
//

import UIKit

class ApiViewController: UIViewController {
    // MARK: - making the get of the api with tableview    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    // MARK: - viewModel
    private var bored: [BoredInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        fetch()
    }
    func fetch() {
        URLSession.shared.request(
            url: Url.baseUrl,
            expecting: BoredInfo.self
        ) { [weak self] result in
            switch result {
            case .success(let bored):
                DispatchQueue.main.async {
                    self?.bored = [bored]
                    self?.table.reloadData()
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    // MARK: - Function responsible for showing the alert if an error occurs
    func showAlert() {
        let alertController = UIAlertController(
            title: "Error",
            message: "Something is wrong!",
            preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

}

extension ApiViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(bored) 
        return bored.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = bored[indexPath.row].activity
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

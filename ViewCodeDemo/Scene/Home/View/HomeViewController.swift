//
//  HomeViewController.swift
//  ViewCodeDemo
//
//  Created by Beatriz Carlos da Silva - BSL on 21/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    let food = ["Pizza", "Hamburguer", "Lasanha", "Coca-cola"]
    
    let contentView: HomeView = {
        let view = HomeView(frame: UIScreen.main.bounds)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    func setDelegates() {
        self.contentView.tableView.delegate = self
        self.contentView.tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = food[indexPath.row]
        return cell
    }
}

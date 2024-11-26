//
//  ViewController.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 21.11.24.
//

import UIKit

class ViewController: UIViewController {
    
    var productManager: IProductDataManageable?
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func presentDetailsVC(_ id: Int) {
        guard let product = productManager?.getProduct(by: id) else { return }
        let detailsVC = DetailsViewController()
        detailsVC.configure(with: product)
        present(detailsVC, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productManager?.getAllProductCategories().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        if let productManager = productManager {
            let categories = productManager.getAllProductCategories()
            let category = categories[indexPath.row]
            cell.configure(with: category)
            cell.action = presentDetailsVC
        } else {
            print("productManager is nil")
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Setup View
private extension ViewController {
    func setupView() {
        view.backgroundColor = Colors.backgroundLight
        setupTableView()
        setupLayout()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }
}

// MARK: - Setup Layout
private extension ViewController {
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

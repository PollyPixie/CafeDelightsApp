//
//  DetailsViewController.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 24.11.24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func configure(with product: ProductModel) {
        imageView.image = UIImage(named: product.imageName)
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
    }
}

// MARK: - Setup View
private extension DetailsViewController {
    func setupView() {
        view.backgroundColor = Colors.backgroundDark
        
        addSubview()
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupPriceLabel()
        setupLayout()
    }
    
    func addSubview() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
    }
    
    func setupImageView() {
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
    }
    
    func setupTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.textAlignment = .center
        titleLabel.textColor = Colors.textSecondary
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.textAlignment = .justified
        descriptionLabel.textColor = Colors.textSecondary
        descriptionLabel.numberOfLines = 0
    }
    
    func setupPriceLabel() {
        priceLabel.font = UIFont.boldSystemFont(ofSize: 24)
        priceLabel.textAlignment = .left
        priceLabel.textColor = Colors.textPrimary
    }
}

// MARK: - Setup Layout
private extension DetailsViewController {
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])
    }
}

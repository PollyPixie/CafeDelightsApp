//
//  CustomProductView.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 22.11.24.
//

import UIKit

class CustomProductView: UIView {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    
    init(product: ProductModel) {
        super.init(frame: .zero)
        setupView()
        configure(with: product)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension CustomProductView {
    func configure(with product: ProductModel) {
        imageView.image = UIImage(named: product.imageName)
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
    }
}

// MARK: - Setup View
private extension CustomProductView {
    func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.masksToBounds = false
        
        addSubview()
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupPriceLabel()
        setupLayout()
    }
    
    func addSubview() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
    }
    
    func setupTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = UIColor(cgColor: CGColor(red: 51/255, green: 0/255, blue: 25/255, alpha: 0.8))
        titleLabel.numberOfLines = 0
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = UIColor(cgColor: CGColor(red: 51/255, green: 0/255, blue: 25/255, alpha: 0.8))
        descriptionLabel.numberOfLines = 0
    }
    
    func setupPriceLabel() {
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = UIColor(cgColor: CGColor(red: 102/255, green: 0/255, blue: 51/255, alpha: 1))
    }
}

// MARK: - Setup Layout
private extension CustomProductView {
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let priceBottomConstraint = priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        priceBottomConstraint.priority = .defaultHigh 
        
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: descriptionLabel.topAnchor, constant: -8),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: priceLabel.topAnchor, constant: -8),
            
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            priceBottomConstraint
        ])
    }
}






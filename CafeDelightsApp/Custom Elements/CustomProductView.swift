//
//  CustomProductView.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 22.11.24.
//

import UIKit

class CustomProductView: UIView {
    
    var action: ((Int) -> ())?
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    
    private var product: ProductModel?
    
    init(product: ProductModel) {
        super.init(frame: .zero)
        self .product = product
        setupView()
        configure(with: product)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //+
        super.touchesBegan(touches, with: event)
        if let productId = product?.id {
            action?(productId)
        }
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
        titleLabel.textColor = Colors.textPrimary
        titleLabel.numberOfLines = 0
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = Colors.textSecondary
        descriptionLabel.numberOfLines = 0
    }
    
    func setupPriceLabel() {
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = Colors.textPrimary
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
        priceBottomConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceBottomConstraint
        ])
    }
}

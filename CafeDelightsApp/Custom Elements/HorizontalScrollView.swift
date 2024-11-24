//
//  HorizontalScrollView.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 22.11.24.
//

import UIKit

class HorizontalScrollView: UIView {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    var action: ((Int) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with products: [ProductModel]) {
        for product in products {
            let productView = CustomProductView(product: product)
            productView.translatesAutoresizingMaskIntoConstraints = false
            productView.widthAnchor.constraint(equalToConstant: 300).isActive = true
            productView.action = tapView
            stackView.addArrangedSubview(productView)
        }
    }
    
    private func tapView(_ id: Int) {
        if let action = action {
            action(id)
        }
    }
}

// MARK: - Setup View
private extension HorizontalScrollView {
    func setupView() {
        scrollView.addSubview(stackView)
        addSubview(scrollView)
        setupStackView()
        setupLayout()
    }
    
    func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 10
    }
}

// MARK: - Setup Layout
private extension HorizontalScrollView {
    func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
}






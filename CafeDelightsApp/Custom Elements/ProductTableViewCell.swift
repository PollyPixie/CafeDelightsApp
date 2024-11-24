//
//  ProductTableViewCell.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 22.11.24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    private let categoryLabel = UILabel()
    private let horizontalScroll = HorizontalScrollView()
    
    var action: ((Int) -> ())? {
        didSet {
            horizontalScroll.action = action
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: ProductCategoryModel) {
        categoryLabel.text = category.title
        horizontalScroll.configure(with: category.products)
    }
    
    // MARK: - Setup Cell
    private func setupCell() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 18)
        categoryLabel.textColor = Colors.textPrimary
        
        contentView.addSubview(categoryLabel)
        contentView.addSubview(horizontalScroll)
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalScroll.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            horizontalScroll.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            horizontalScroll.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalScroll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalScroll.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

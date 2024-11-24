//
//  ProductDataManager.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 22.11.24.
//

import Foundation

protocol IProductDataManageable {
    func getAllProductCategories() -> [ProductCategoryModel]
    func getProduct(by id: Int) -> ProductModel?
    func getAllProducts() -> [ProductModel]
}

class ProductDataManager {
    private var productCategories: [ProductCategoryModel] = []
    
    init(productCategories: [ProductCategoryModel]) {
        self.productCategories = productCategories
    }
}

// MARK: - IProductDataManageable
extension ProductDataManager: IProductDataManageable {
    func getAllProductCategories() -> [ProductCategoryModel] {
        productCategories
    }
    
    func getProduct(by id: Int) -> ProductModel? {
        for category in productCategories {
            if let product = category.products.first(where: { $0.id == id }) {
                return product
            }
        }
        return nil
    }
    
    func getAllProducts() -> [ProductModel] {
        return productCategories.flatMap { $0.products } // Собираем все продукты из всех категорий
    }
}


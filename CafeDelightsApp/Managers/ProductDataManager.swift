//
//  ProductDataManager.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 22.11.24.
//

import Foundation

protocol IProductDataManageable {
    func getAllProductCategories() -> [ProductCategoryModel]
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
}


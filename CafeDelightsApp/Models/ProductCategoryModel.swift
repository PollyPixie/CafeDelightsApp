//
//  ProductCategoryModel.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 22.11.24.
//

import Foundation

struct ProductCategoryModel {
    let title: String
    let products: [ProductModel]
}

struct ProductModel {
    let id: Int
    let imageName: String
    let title: String
    let description: String
    let price: Double
}

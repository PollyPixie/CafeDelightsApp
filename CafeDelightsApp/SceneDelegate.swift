//
//  SceneDelegate.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 21.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let productDataManager = createProductDataManager()
        
        let viewController = ViewController()
        viewController.productManager = productDataManager
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    private func createProductDataManager() -> IProductDataManageable {
        let productRepository = ProductRepository()
        let categories = productRepository.getProducts()
        let productDataManager: IProductDataManageable = ProductDataManager(productCategories: categories)
        return productDataManager
    }
}

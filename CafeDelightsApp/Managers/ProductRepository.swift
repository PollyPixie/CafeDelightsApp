//
//  ProductRepository.swift
//  CafeDelightsApp
//
//  Created by Полина Соколова on 22.11.24.
//

import Foundation

protocol IProductProvidable {
    func getProducts() -> [ProductCategoryModel]
}

class ProductRepository { }

// MARK: - IProductProvidable
extension ProductRepository: IProductProvidable {
    func getProducts() -> [ProductCategoryModel] {
        [
            ProductCategoryModel(
                title: "Drinks",
                products: [
                    ProductModel(
                        id: 1,
                        imageName: "cappuccino",
                        title: "Cappuccino",
                        description: "A smooth and rich cappuccino made with freshly brewed espresso, steamed milk, and a frothy milk top, lightly dusted with cocoa for a perfect balance of bold and creamy flavors.",
                        price: 5.0
                    ),
                    ProductModel(
                        id: 2,
                        imageName: "matcha",
                        title: "Matcha Latte",
                        description: "A calming and energizing matcha latte made with finely ground matcha tea powder and steamed milk, offering a vibrant green color and a smooth, earthy flavor.",
                        price: 6.0
                    ),
                    ProductModel(
                        id: 3,
                        imageName: "cocoa",
                        title: "Hot Cocoa",
                        description: "A creamy and indulgent hot cocoa made from rich chocolate and milk, topped with a fluffy layer of whipped cream or marshmallows for a cozy, comforting treat.",
                        price: 5.0
                    ),
                    ProductModel(
                        id: 4,
                        imageName: "lemonade",
                        title: "Citrus Lemonade",
                        description: "A refreshing and zesty citrus lemonade made with a blend of fresh oranges, lemons, and limes, served over ice and garnished with mint.",
                        price: 4.0
                    ),
                    ProductModel(
                        id: 5,
                        imageName: "tea",
                        title: "Fruit Tea",
                        description: "A fruity and aromatic blend of infused tea with a mix of vibrant fruits like berries, apple, and citrus, offering a refreshing and naturally sweet beverage.",
                        price: 4.0
                    )
                ]
            ),
            ProductCategoryModel(
                title: "Hearty Snacks",
                products: [
                    ProductModel(
                        id: 6,
                        imageName: "pizza",
                        title: "Pizza",
                        description: "A classic Italian dish with a thin crust, rich tomato sauce, and melted cheese. Perfectly baked to golden perfection and topped with fresh ingredients for a delicious bite.",
                        price: 10.0
                    ),
                    ProductModel(
                        id: 7,
                        imageName: "hotDog",
                        title: "Hot Dog",
                        description: "A soft bun filled with a juicy grilled sausage, topped with ketchup and mustard. A simple yet satisfying choice for a quick and tasty snack.",
                        price: 4.0
                    ),
                    ProductModel(
                        id: 8,
                        imageName: "sandwich",
                        title: "Sandwich",
                        description: "Grilled chicken fillet layered with fresh lettuce and tomatoes in toasted bread. A hearty and wholesome option for a filling meal.",
                        price: 6.0
                    ),
                    ProductModel(
                        id: 9,
                        imageName: "bruschetta",
                        title: "Bruschetta",
                        description: "Crispy toasted bread topped with creamy avocado slices and delicate smoked salmon. Garnished with arugula for a fresh and flavorful appetizer.",
                        price: 8.0
                    ),
                    ProductModel(
                        id: 10,
                        imageName: "croissant",
                        title: "Croissant",
                        description: "A flaky golden croissant filled with savory ham and melted cheese. A perfect combination of buttery pastry and hearty flavors.",
                        price: 6.0
                    )
                ]
            ),
            ProductCategoryModel(
                title: "Desserts",
                products: [
                    ProductModel(
                        id: 11,
                        imageName: "meringueRoll",
                        title: "Berry Meringue Roll",
                        description: "A delicate meringue roll filled with whipped cream and mixed berries. Topped with fresh fruit and a drizzle of berry sauce for a sweet and light treat.",
                        price: 9.0
                    ),
                    ProductModel(
                        id: 12,
                        imageName: "cherryPie",
                        title: "Cherry Pie",
                        description: "A slice of classic cherry pie with a golden lattice crust and juicy cherry filling. Perfectly baked and served with a rich, homemade flavor.",
                        price: 5.0
                    ),
                    ProductModel(
                        id: 13,
                        imageName: "iceCream",
                        title: "Ice Cream Sundae",
                        description: "Three scoops of creamy ice cream topped with whipped cream, colorful sprinkles, and a cherry. A classic dessert for any occasion.",
                        price: 6.0
                    ),
                    ProductModel(
                        id: 14,
                        imageName: "cheesecake",
                        title: "Berry Cheesecake",
                        description: "A creamy cheesecake topped with a medley of fresh berries. Smooth and rich, with a buttery graham cracker crust.",
                        price: 7.0
                    ),
                    ProductModel(
                        id: 15,
                        imageName: "macarons",
                        title: "Macarons",
                        description: "Delicate French macarons in an array of pastel colors. Crisp on the outside and soft inside, filled with rich and flavorful cream. Box of 10 pieces.",
                        price: 12.0
                    )
                ]
            )
        ]
    }
}

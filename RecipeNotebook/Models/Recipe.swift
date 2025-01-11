//
//  Recipe.swift
//  RecipeNotebook
//
//  Created by Ильяс Жанаев on 11.01.2025.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let description: String
    let steps: [Step]
}

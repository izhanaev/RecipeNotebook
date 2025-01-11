//
//  Step.swift
//  RecipeNotebook
//
//  Created by Ильяс Жанаев on 11.01.2025.
//

import Foundation

struct Step: Decodable, Identifiable {
    let id: Int
    let description: String
}

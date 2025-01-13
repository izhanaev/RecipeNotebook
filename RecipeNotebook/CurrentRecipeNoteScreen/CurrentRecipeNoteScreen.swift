//
//  CurrentRecipeNoteScreen.swift
//  RecipeNotebook
//
//  Created by Ильяс Жанаев on 11.01.2025.
//

import SwiftUI

struct CurrentRecipeNoteScreen: View {
    var recipe: Recipe

    var body: some View {
        List(recipe.steps, id: \.id) { step in
            VStack(alignment: .leading) {
                Text("Step \(step.id):")
                    .font(.headline)
                Text(step.description)
                    .font(.body)
                    .padding(.bottom, 10)
            }
            .padding(.vertical, 5)
        }
        .navigationTitle("\(recipe.title) - Steps")
    }
}

struct CurrentRecipeNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        CurrentRecipeNoteScreen(recipe: RecipeListScreen().readJSON()[0])
    }
}


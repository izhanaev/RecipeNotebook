//
//  RecipeListScreen.swift
//  RecipeNotebook
//
//  Created by Ильяс Жанаев on 11.01.2025.
//

import SwiftUI

struct RecipeListScreen: View {
    @State private var recipes: [Recipe] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    ProgressView()
                } else if let errorMessage = errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(recipes, id: \.id) { recipe in
                        NavigationLink(destination: RecipeNoteScreen(recipe: recipe)) {
                            HStack {
                                Image(recipe.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(.circle)
                                VStack(alignment: .leading) {
                                    Text(recipe.title)
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                    Text(recipe.description)
                                        .font(.system(size: 12))
                                        .lineLimit(3)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .task {
                await loadRecipes()
            }
        }
    }

    private func loadRecipes() async {
        isLoading = true
        errorMessage = nil

        do {
            recipes = try await readJSON()
        } catch {
            errorMessage = error.localizedDescription
            print("Error loading recipes: \(error)")
        }

        isLoading = false
    }

    private func readJSON() async throws -> [Recipe] {
        guard let url = Bundle.main.url(forResource: "Recipes", withExtension: "json") else {
            throw JSONError.fileNotFound
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([Recipe].self, from: data)
    }
}

enum JSONError: Error {
    case fileNotFound
    case decodingFailed
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListScreen()
    }
}




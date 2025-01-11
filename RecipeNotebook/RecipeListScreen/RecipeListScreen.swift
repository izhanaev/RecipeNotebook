//
//  RecipeListScreen.swift
//  RecipeNotebook
//
//  Created by Ильяс Жанаев on 11.01.2025.
//

import SwiftUI

struct RecipeListScreen: View {
    
    var recipes: [Recipe]?
    
    init() {
        self.recipes = readJSON()
    }
    
    var body: some View {
        NavigationView {
            List(recipes ?? [], id: \.id) { recipe in
                NavigationLink(destination: RecipeNoteScreen(recipe: recipe)) {
                    HStack {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                    }
                    .padding(.trailing, 8)
                    VStack(alignment: .leading) {
                        Text(recipe.title)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.bottom, 4)
                        Text(recipe.description)
                            .font(.system(size: 12))
                            .lineLimit(3)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
    
    func readJSON() -> [Recipe] {
        guard let url = Bundle.main.url(forResource: "Recipes", withExtension: "json") else {
            print("JSON file not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let recipes = try decoder.decode([Recipe].self, from: data)
            return recipes
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return []
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListScreen()
    }
}




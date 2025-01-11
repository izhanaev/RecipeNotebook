//
//  RecipeNoteScreen.swift
//  RecipeNotebook
//
//  Created by Ильяс Жанаев on 11.01.2025.
//

import SwiftUI

struct RecipeNoteScreen: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Text(recipe.title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            Image(recipe.image)
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFit()
                .clipShape(.circle)
                .padding(.bottom, 20)
            Text(recipe.description)
                .font(.title3)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.top, 20)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeNoteScreen(recipe: RecipeListScreen().readJSON()[0])
        }
    }
}

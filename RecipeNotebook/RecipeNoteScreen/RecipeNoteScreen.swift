//
//  RecipeNoteScreen.swift
//  RecipeNotebook
//
//  Created by Ильяс Жанаев on 11.01.2025.
//

import SwiftUI

struct RecipeNoteScreen: View {

    @State private var isImageScaled = false
    @AppStorage private var isFavorite: Bool

    var recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
        self._isFavorite = AppStorage(wrappedValue: false, "isFavorite_\(recipe.id)")
    }

    var body: some View {
        VStack {
            Text("\(isFavorite ? "⭐️" : "")" + "\(recipe.title)")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            Image(recipe.image)
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFit()
                .clipShape(.circle)
                .scaleEffect(isImageScaled ? 1.0 : 0.8)
                .animation(.easeInOut(duration: 1), value: isImageScaled)
                .onAppear {
                    isImageScaled = true
                }
                .padding(.bottom, 20)
            Text(recipe.description)
                .font(.title3)
                .multilineTextAlignment(.center)
            Spacer()

            Button {
                isFavorite.toggle()
            } label: {
                Text(isFavorite ? "Remove from Favorites" : "Make Favorite ⭐️")
            }

            NavigationLink(destination: CurrentRecipeNoteScreen(recipe: recipe)) {
                Text("View Cooking Steps")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
        }
        .padding(.top, 20)
        .padding(.horizontal, 16)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeNoteScreen(recipe: RecipeListScreen().readJSON()[0])
        }
    }
}

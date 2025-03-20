//
//  RecipeTests.swift
//  RecipeNotebookTests
//
//  Created by Ильяс Жанаев on 20.03.2025.
//

import XCTest
@testable import RecipeNotebook // Импортируем основной модуль

class RecipeTests: XCTestCase {

    // MARK: - Тест загрузки JSON-файла

    func testReadJSONFileExists() {
        // Arrange
        let recipeListScreen = RecipeListScreen()

        // Act
        let recipes = recipeListScreen.readJSON()

        // Assert
        XCTAssertFalse(recipes.isEmpty, "JSON-файл должен содержать данные.")
    }

    // MARK: - Тест декодирования JSON

    func testDecodeJSON() {
        // Arrange
        let recipeListScreen = RecipeListScreen()

        // Act
        let recipes = recipeListScreen.readJSON()

        // Assert
        XCTAssertEqual(recipes.count, 10, "Должно быть 10 рецептов в JSON-файле.")
        XCTAssertEqual(recipes[0].title, "Spaghetti Carbonara 🇮🇹", "Первый рецепт должен быть 'Spaghetti Carbonara'.")
        XCTAssertEqual(recipes[1].title, "Sushi 🇯🇵", "Второй рецепт должен быть 'Sushi'.")
        XCTAssertEqual(recipes[2].title, "Paella 🇪🇸", "Третий рецепт должен быть 'Paella'.")
    }

    // MARK: - Тест структуры данных

    func testRecipeStructure() {
        // Arrange
        let recipeListScreen = RecipeListScreen()
        let recipes = recipeListScreen.readJSON()

        // Act
        let firstRecipe = recipes[0]

        // Assert
        XCTAssertEqual(firstRecipe.id, 1, "ID первого рецепта должен быть 1.")
        XCTAssertEqual(firstRecipe.image, "SpaghettiCarbonara", "Изображение первого рецепта должно быть 'SpaghettiCarbonara'.")
        XCTAssertEqual(firstRecipe.description, "A classic Roman pasta dish made with eggs, cheese, pancetta, and black pepper.", "Описание первого рецепта должно быть корректным.")
        XCTAssertEqual(firstRecipe.steps.count, 5, "Первый рецепт должен содержать 5 шагов.")
    }

    // MARK: - Тест шагов рецепта

    func testRecipeSteps() {
        // Arrange
        let recipeListScreen = RecipeListScreen()
        let recipes = recipeListScreen.readJSON()
        let firstRecipeSteps = recipes[0].steps

        // Assert
        XCTAssertEqual(firstRecipeSteps[0].id, 1, "ID первого шага должен быть 1.")
        XCTAssertEqual(firstRecipeSteps[0].description, "Cook spaghetti in salted boiling water.", "Описание первого шага должно быть корректным.")
        XCTAssertEqual(firstRecipeSteps[1].id, 2, "ID второго шага должен быть 2.")
        XCTAssertEqual(firstRecipeSteps[1].description, "Fry pancetta or guanciale until crispy.", "Описание второго шага должно быть корректным.")
    }

    // MARK: - Тест на случай отсутствия JSON-файла

    func testReadJSONFileNotFound() {
        // Arrange
        let recipeListScreen = RecipeListScreen()

        // Act
        let recipes = recipeListScreen.readJSON()

        // Assert
        XCTAssertFalse(recipes.isEmpty, "Если файл не найден, должен возвращаться пустой массив.")
    }
}

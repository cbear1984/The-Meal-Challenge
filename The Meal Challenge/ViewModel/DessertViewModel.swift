//
//  DessertViewModel.swift
//  The Meal Challenge
//
//  Created by Chris Bearden on 6/27/24.
//

import Foundation

@MainActor
final class DessertViewModel: ObservableObject {
    @Published var meal = [Meal]()
    @Published var error: Error?
    @Published var isLoading = true
    
    let BASE_URL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    let MEAL_URL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    init() {
        loadData()
    }
    
    func handleRefresh() {
        meal = [Meal]()
        loadData()
    }
    // I loaded the base URL first to set the model object. I used this to help with navigation to the detail screen.
    func getData() async throws {
        do {
            isLoading = true
            print("////////////////////LOADING BASE_URL////////////////////")
            guard let url = URL(string: BASE_URL) else {
                throw CustomError.invalidURL
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw CustomError.invalidResponse
            }
            guard let dessert = try? JSONDecoder().decode(Dessert.self, from: data) else {
                throw CustomError.invalidData
            }
            self.meal = dessert.meals
            isLoading = false
        } catch {
            self.error = error
            isLoading = false
        }
    }
    // after the base URL is loaded, the meal details for the fist batch of objects gets updated at index. I used two seperate functions to keep the code more readable.
    func getMealData(mealId: String) async throws {
        do {
            print("////////////////////LOADING MEAL_URL////////////////////")
            guard let url = URL(string: MEAL_URL + mealId) else {
                throw CustomError.invalidURL
            }
            print("Url... \(url)")
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw CustomError.invalidResponse
            }
            guard let meal = try? JSONDecoder().decode(Dessert.self, from: data) else {
                throw CustomError.invalidData
            }
            let newMealItem = meal.meals.filter({$0.idMeal == mealId})
            print("""
                  START////////////////////newMealItem()////////////////////START
                  \(newMealItem)
                                    END////////////////////newMealItem()////////////////////END
                  """)
            let mealIndex = self.meal.filter({$0.idMeal == mealId})
            self.meal.replace(mealIndex, with: newMealItem)
            print("""
                  START////////////////////UPDATED MEAL AT INDEX////////////////////START
                  \(self.meal)
                                    END////////////////////UPDATED MEAL AT INDEX////////////////////END
                  """)
            
        } catch {
            self.error = error
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await getData()
        }
    }
    func loadMealData(mealId: String) {
        Task(priority: .medium) {
            try await getMealData(mealId: mealId)
        }
    }
}


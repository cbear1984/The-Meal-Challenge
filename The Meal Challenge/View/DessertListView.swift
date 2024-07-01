//
//  DessertListView.swift
//  The Meal Challenge
//
//  Created by Chris Bearden on 6/27/24.
//

import SwiftUI

struct DessertListView: View {
    @StateObject private var viewModel = DessertViewModel()
    @State private var showAlert = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(viewModel.meal, id: \.idMeal) { meals in
                NavigationLink(value: meals) {
                    DessertCellView(mealImg: meals.strMealThumb, title: meals.strMeal ?? "", mealId: meals.idMeal ?? "")
                }
                .disabled(viewModel.isLoading)
                .task {
                    viewModel.loadMealData(mealId: meals.idMeal ?? "")
                }
            }
            .navigationTitle("Desserts")
            .navigationDestination(for: Meal.self) { item in
                DetailView(meal: item)
            }
            .onAppear {
                viewModel.loadData()
            }
            .onReceive(viewModel.$error, perform: { err in
                if err != nil {
                    showAlert = true
                }
            })
            .navigationTitle("Dessert Menu")
            .refreshable {
                viewModel.handleRefresh()
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.error?.localizedDescription ?? "Something went wrong" ),
                dismissButton: .default(Text("Ok")) {
                    showAlert = false
                }
            )
        })
    }
}

#Preview {
    DessertListView()
}

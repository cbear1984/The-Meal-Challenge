//
//  DetailView.swift
//  The Meal Challenge
//
//  Created by Chris Bearden on 6/27/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = DessertViewModel()
    var meal: Meal
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                VStack {
                    ProgressView()
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .center
                )
                .background(Color.gray.opacity(0.9))

            } else {
                ScrollView {
                    HStack {
                        AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    VStack(alignment: .leading) {
                        Text(meal.strMeal ?? "")
                            .font(.title)
                            .bold()
                    }
                    VStack(spacing: 12) {
                        Text("Ingredients")
                            .font(.headline)
                        // I am not sure why the data for the ingredients is not in an array 🤷🏼‍♂️. For this reason I chose to evaluate each one. Issue's i was having was with the Navigation Value being set from the start of the navigation and I am not sure how to publish changes to that Value inside of NavigationDestination. If I could figure that out I would evaluate these on the view model instead. 
                        Group {
                            if meal.strIngredient1 != "" {
                                Text(meal.strIngredient1 ?? "")
                            }
                            if meal.strIngredient2 != "" {
                                Text(meal.strIngredient2 ?? "")
                            }
                            if meal.strIngredient3 != "" {
                                Text(meal.strIngredient3 ?? "")
                            }
                            if meal.strIngredient4 != "" {
                                Text(meal.strIngredient4 ?? "")
                            }
                            if meal.strIngredient5 != "" {
                                Text(meal.strIngredient5 ?? "")
                            }
                            if meal.strIngredient6 != "" {
                                Text(meal.strIngredient6 ?? "")
                            }
                            if meal.strIngredient7 != "" {
                                Text(meal.strIngredient7 ?? "")
                            }
                            if meal.strIngredient8 != "" {
                                Text(meal.strIngredient8 ?? "")
                            }
                            if meal.strIngredient9 != "" {
                                Text(meal.strIngredient9 ?? "")
                            }
                            if meal.strIngredient10 != "" {
                                Text(meal.strIngredient10 ?? "")
                            }
                        }
                        Group {
                            if meal.strIngredient11 != "" {
                                Text(meal.strIngredient11 ?? "")
                            }
                            if meal.strIngredient12 != "" {
                                Text(meal.strIngredient12 ?? "")
                            }
                            if meal.strIngredient13 != "" {
                                Text(meal.strIngredient13 ?? "")
                            }
                            if meal.strIngredient14 != "" {
                                Text(meal.strIngredient14 ?? "")
                            }
                            if meal.strIngredient15 != "" {
                                Text(meal.strIngredient15 ?? "")
                            }
                            if meal.strIngredient16 != "" {
                                Text(meal.strIngredient16 ?? "")
                            }
                            if meal.strIngredient17 != "" {
                                Text(meal.strIngredient17 ?? "")
                            }
                            if meal.strIngredient18 != "" {
                                Text(meal.strIngredient18 ?? "")
                            }
                            if meal.strIngredient19 != "" {
                                Text(meal.strIngredient19 ?? "")
                            }
                            if meal.strIngredient20 != "" {
                                Text(meal.strIngredient20 ?? "")
                            }
                        }
                    }
                    VStack(spacing: 12) {
                        Text("Instructions")
                            .font(.headline)
                        Text(meal.strInstructions ?? "No text")
                            .multilineTextAlignment(.leading)
                            .font(.caption2)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .refreshable {
            viewModel.loadMealData(mealId: meal.idMeal ?? "")
        }
    }
}
#Preview {
    DetailView(meal: Meal(idMeal: "52893", strMeal: "Apple & Blackberry Crumble", strDrinkAlternate: true, strCategory: "", strArea: "", strInstructions: "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg", strTags: "", strYoutube: "", strIngredient1: "Plain Flour", strIngredient2: "Caster Sugar", strIngredient3: "Butter", strIngredient4: "Braeburn Apples", strIngredient5: "Butter", strIngredient6: "Demerara Sugar", strIngredient7: "Blackberrys", strIngredient8: "Cinnamon", strIngredient9: "Ice Cream", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strSource: "", strImageSource: "", strCreativeCommonsConfirmed: false, dateModified: ""))
}


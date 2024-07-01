//
//  DessertCellView.swift
//  The Meal Challenge
//
//  Created by Chris Bearden on 6/27/24.
//

import SwiftUI

struct DessertCellView: View {
        
    var mealImg: String?
    var title: String?
    var mealId: String?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: mealImg ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, alignment: .center)
                } placeholder: {
                    ProgressView()
                }
                Text(title ?? "")
            }
        }
    }
}

#Preview {
    DessertCellView(
        mealImg: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
        title: "Apple & Blackberry Crumble"
    )
}

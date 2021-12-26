//
//  RecipeDetailView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack (alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("• " + item)
                    }
                }
                .padding(.horizontal)
                
                // MARK: Directions
                VStack (alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(0..<recipe.directions.count, id:\.self) { item in
                        Text(String(item + 1) + ". " + recipe.directions[item])
                            .padding(.bottom, 2)
                    }
                    
                }
                .padding(.horizontal)
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipe[0])
    }
}

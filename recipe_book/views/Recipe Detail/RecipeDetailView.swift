//
//  RecipeDetailView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                let image = UIImage(data: recipe.image ?? Data()) ?? UIImage()
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .font(.largeTitle)
                    .padding(.leading)
                    .padding(.bottom, 5)
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving Size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack (alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach (recipe.ingredients.allObjects as! [Ingredient]) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name)
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
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipe[0])
    }
}

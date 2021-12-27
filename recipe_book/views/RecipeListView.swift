//
//  ContentView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            List(model.recipe) { r in
                
                NavigationLink (destination: RecipeDetailView(recipe: r)) {
                    HStack(spacing: 20.0) {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                            
                    }
                }
            }.navigationBarTitle("Recipe List")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}

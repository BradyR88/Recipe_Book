//
//  AddRecipeView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 2/24/22.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    var body: some View {
        
        VStack {
            HStack {
                
                Button {
                    // clar the form
                } label: {
                    Text("Clear")
                }
                
                Spacer()
                
                Button {
                    // add the data to core data
                    // clar the form
                } label: {
                    Text("Add")
                }
                
            }
            
            ScrollView (showsIndicators: false) {
                
                VStack {
                    
                    AddMetaData(name: $name,
                                summary: $summary,
                                prepTime: $prepTime,
                                cookTime: $cookTime,
                                totalTime: $totalTime,
                                servings: $servings)
                    
                    AddListData(list: $highlights, title: "Highlights", placeHolderText: "Vegetarian")
                    AddListData(list: $directions, title: "Airections", placeHolderText: "Add the oil to the pan")
                    
                }
                
            }
        }
        .padding(.horizontal)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}

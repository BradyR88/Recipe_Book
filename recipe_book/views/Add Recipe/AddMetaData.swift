//
//  AddMetaData.swift
//  recipe_book
//
//  Created by Brady Robshaw on 2/24/22.
//

import SwiftUI

struct AddMetaData: View {
    
    @Binding var name: String
    @Binding var summary: String
    @Binding var prepTime: String
    @Binding var cookTime: String
    @Binding var totalTime: String
    @Binding var servings: String
    
    var body: some View {
        
        Group {
            HStack {
                Text("Name: ")
                TextField("Tuna Casserole", text: $name)
            }
            HStack {
                Text("Summary: ")
                TextField("A delicious meal for the whole family", text: $summary)
            }
            HStack {
                Text("Prep Time: ")
                TextField("1 hours", text: $prepTime)
            }
            HStack {
                Text("Cook Time: ")
                TextField("2 hours", text: $cookTime)
            }
            HStack {
                Text("Total Time: ")
                TextField("3 hours", text: $totalTime)
            }
            HStack {
                Text("Servings: ")
                TextField("6", text: $servings)
            }
        }
        
    }
}

//struct AddMetaData_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMetaData()
//    }
//}

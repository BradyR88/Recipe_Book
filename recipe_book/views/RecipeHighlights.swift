//
//  RecipeHighlights.swift
//  recipe_book
//
//  Created by Brady Robshaw on 1/1/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHilights = ""
    
    init(highlights:[String]) {
        
        for index in 0..<highlights.count {
            
            if index == highlights.count - 1 {
                allHilights += highlights[index]
            }
            else {
                allHilights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHilights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2"])
    }
}

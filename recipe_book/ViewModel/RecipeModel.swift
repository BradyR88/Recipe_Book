//
//  RecipeListVist.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipe = [Recipe]()
    
    init() {
        self.recipe = jsonUnpack.unpcack()
    }
    
}

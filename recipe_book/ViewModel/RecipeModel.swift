//
//  RecipeListVist.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import Foundation
import SwiftUI

class RecipeModel: ObservableObject {
    
    let managedObjectContexed = PersistenceController.shared.container.viewContext
    
    @Published var recipe = [Recipe]()
    
    init() {
        
        // check if we have preloaded the data into core data
        checkLoadedData()
        
    }
    
    func checkLoadedData() {
        
        // check local storage for the flag
        let status = UserDefaults.standard.bool(forKey: Constants.isDataPreloaded)
        
        // if it's false, then we should par the local Jason and preload into core data
        if status == false {
            preLoadLocalData()
        }
        
    }
    
    func preLoadLocalData() {
        // pars the local json file
        let localRecipes = jsonUnpack.unpcack()
        
        // create core data objects
        for r in localRecipes {
            
            // creat a core data object
            let recipe = Recipe(context: managedObjectContexed)
            recipe.cookTime = r.cookTime
            recipe.directions = r.directions
            recipe.featured = r.featured
            recipe.highlights = r.highlights
            recipe.id = UUID()
            recipe.image = UIImage(named: r.image)?.jpegData(compressionQuality: 1.0)
            recipe.name = r.name
            recipe.prepTime = r.prepTime
            recipe.servings = r.servings
            recipe.summary = r.description
            recipe.totalTime = r.totalTime
            
            // set the ingredients
            for i in r.ingredients {
                let ingredient = Ingredient(context: managedObjectContexed)
                ingredient.id = UUID()
                ingredient.name = i.name
                ingredient.unit = i.unit
                ingredient.denom = i.denom ?? 1
                ingredient.num = i.num ?? 1
                
                // add this ingredient to the recipe
                recipe.addToIngredients(ingredient)
                
            }
            
        }
        
        // save core data
        do {
            try managedObjectContexed.save()
            UserDefaults.standard.setValue(true, forKey: Constants.isDataPreloaded)
        }
        catch {
            
        }
        
        // set local storage flag
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num
        var denominator = ingredient.denom
        var wholePortion = 0
         
    
    
        
        //get a singal serving size by mutaplaing denomanator by the  recapy servings
        denominator *= recipeServings
        
        //get target portion by mutaplying the numeratoer by the target servings
        numerator *= targetServings
        
        //redce the fration by gratust common divisor
        let divisor = Rational.greatestCommonDivisor(numerator, denominator)
        numerator /= divisor
        denominator /= divisor
        //get the whole portin if the nuarator > denomonator
        if numerator >= denominator {
            wholePortion = numerator / denominator
            numerator = numerator % denominator
            portion += String(wholePortion)
        }
        
        //Expres the remandor as a fration
        if numerator > 0 {
            portion += wholePortion > 0 ? " " : ""
            portion += "\(numerator)/\(denominator)"
        }
        
    
        
        if var unit = ingredient.unit {
            
            //do we nead to mack plerl
            if wholePortion > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
                
            }
            
            portion += ingredient.num == nil ? "" : " "
            
            return portion + unit
        }
        
        return String(portion)
    }
    
}

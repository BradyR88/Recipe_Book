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

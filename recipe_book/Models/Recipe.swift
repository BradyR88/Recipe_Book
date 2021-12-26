//
//  Recipe.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    // this machis the data format of recipes.json
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
}

class Ingredient: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
